from fastapi import UploadFile, File, HTTPException, Depends
from sqlalchemy.orm import Session
from Crypto.Cipher import AES
import base64
from Crypto.Random import get_random_bytes
from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_OAEP
from database import get_db,Base
from models.image_model import Image
from models.message_model import Message
from schemas.image_schema import ImageSchema ,ImageCreate, ImageResponse
from schemas.message_schema import MessageSchema
from models.user_model import User
import os
import base64
from services.key_management import KeyManagement
from cryptography.hazmat.primitives.asymmetric import padding as rsa_padding
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.backends import default_backend
from datetime import datetime

os.makedirs("uploads", exist_ok=True)
os.makedirs("keys", exist_ok=True)
class ImageController:

    def get_image(db: Session, image_id: int):
        image = db.query(Image).filter(Image.image_id == image_id).first()
        if not image:
            raise HTTPException(status_code=404, detail="Image not found")
        return image

    def get_all_images(db: Session):
        images = db.query(Image).all()
        return images

    def create_image(db: Session, image: ImageSchema):
        db_image = Image(**image.dict())
        db.add(db_image)
        db.commit()
        db.refresh(db_image)
        return db_image

    def update_image(db: Session, image_id: int, image_data: ImageSchema):
        db_image = db.query(Image).filter(Image.image_id == image_id).first()
        if not db_image:
            raise HTTPException(status_code=404, detail="Image not found")
        
        for key, value in image_data.dict(exclude_unset=True).items():
            setattr(db_image, key, value)
        
        db.commit()
        db.refresh(db_image)
        return db_image

    def delete_image(db: Session, image_id: int):
        db_image = db.query(Image).filter(Image.image_id == image_id).first()
        if not db_image:
            raise HTTPException(status_code=404, detail="Image not found")
        
        db.delete(db_image)
        db.commit()
        return {"detail": "Image deleted successfully"}
    
    async def upload_image(sender_id: int, receiver_id: int, file: UploadFile = File(...), db: Session = Depends(get_db)):
        # เจน AES key
        aes_key = get_random_bytes(16)  # 16 bytes for AES-128

        # อ่านข้อมูลภาพ
        contents = await file.read()

        # เข้ารหัสภาพด้วย AES
        cipher = AES.new(aes_key, AES.MODE_GCM)
        ciphertext, tag = cipher.encrypt_and_digest(contents)

        # สร้าง entry ในตาราง images ก่อนเพื่อให้ได้ image_id
        db_image = Image(storage_url="", encryption_key="")
        db.add(db_image)
        db.commit()
        db.refresh(db_image)

        # สร้างชื่อไฟล์ตามรูปแบบที่ต้องการในรูปแบบ .bin
        encrypted_image_path = f"uploads/{db_image.image_id}_{file.filename}.bin"

        # เขียนภาพที่เข้ารหัสไปยังไฟล์ไบนารี
        with open(encrypted_image_path, 'wb') as f:
            f.write(cipher.nonce)  # เขียน nonce ไปยังไฟล์
            f.write(tag)           # เขียน tag ไปยังไฟล์
            f.write(ciphertext)    # เขียน ciphertext ไปยังไฟล์

        # ค้นหา public key ของผู้รับ
        receiver = db.query(User).filter(User.user_id == receiver_id).first()
        if not receiver:
            raise HTTPException(status_code=404, detail="Receiver not found")

        # โหลด public key จากฐานข้อมูล
        public_key = serialization.load_pem_public_key(receiver.public_key.encode(), backend=default_backend())

        # เข้ารหัส AES key ด้วย public key
        encrypted_aes_key = public_key.encrypt(
            aes_key,
            rsa_padding.OAEP(
                mgf=rsa_padding.MGF1(algorithm=hashes.SHA256()),
                algorithm=hashes.SHA256(),
                label=None
            )
        )

        # อัพเดต storage_url และ encryption_key ในฐานข้อมูล
        db_image.storage_url = encrypted_image_path
        db_image.encryption_key = base64.b64encode(encrypted_aes_key).decode('utf-8')

        db.commit()
        db.refresh(db_image)

        # สร้าง entry ในตาราง message
        db_message = Message(
            sender_id=sender_id,
            receiver_id=receiver_id,
            timestamp=datetime.utcnow(),
            content="",  # กำหนด content เป็น "" หรือจะใช้ None ตามต้องการ
            image_id=db_image.image_id,  # ผูกกับ image_id ที่ถูกสร้าง
            message_type=True  # กำหนด message_type เป็น True (ข้อความประเภทรูปภาพ)
        )

        db.add(db_message)
        db.commit()
        db.refresh(db_message)

        return {
            "image_id": db_image.image_id,
            "image_path": db_image.storage_url,
            "encryption_key": db_image.encryption_key,
            "message_id": db_message.message_id
        }


    
    def decrypt_image(db: Session, image_id: int, user_id: int):
        # ค้นหารูปภาพในฐานข้อมูล
        image = db.query(Image).filter(Image.image_id == image_id).first()

        if not image:
            raise HTTPException(status_code=404, detail="Image not found")

        # อ่าน private key ของผู้รับจากไฟล์
        private_key_path = f"keys/private_key_{user_id}.pem"
        if not os.path.exists(private_key_path):
            raise HTTPException(status_code=404, detail="Private key not found")

        # โหลด private key
        try:
            with open(private_key_path, 'rb') as key_file:
                private_key = serialization.load_pem_private_key(
                    key_file.read(),
                    password=None,
                    backend=default_backend()
                )
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Failed to load private key: {str(e)}")

        # ถอดรหัส AES key ด้วย RSA private key
        encrypted_aes_key = base64.b64decode(image.encryption_key)
        aes_key = private_key.decrypt(
            encrypted_aes_key,
            padding=rsa_padding.OAEP(
                mgf=rsa_padding.MGF1(algorithm=hashes.SHA256()),
                algorithm=hashes.SHA256(),
                label=None
            )
        )

        # อ่านข้อมูลภาพที่เข้ารหัสจากไฟล์ .bin
        with open(image.storage_url, 'rb') as f:
            nonce = f.read(16)  # อ่าน nonce
            tag = f.read(16)    # อ่าน tag
            ciphertext = f.read()  # อ่าน ciphertext

        # ถอดรหัสภาพด้วย AES
        cipher = AES.new(aes_key, AES.MODE_GCM, nonce=nonce)
        try:
            decrypted_image = cipher.decrypt_and_verify(ciphertext, tag)
        except ValueError:
            raise HTTPException(status_code=400, detail="การตรวจสอบความถูกต้องล้มเหลว! ข้อมูลอาจถูกดัดแปลง.")
        with open('decrypted_image.jpg', 'wb') as f:
            f.write(decrypted_image)
            print(decrypted_image)
            print("การเข้ารหัสและถอดรหัสเสร็จสมบูรณ์!")

        print(decrypted_image)
        return base64.b64encode(decrypted_image).decode('utf-8')
