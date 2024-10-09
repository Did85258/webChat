from fastapi import HTTPException
from sqlalchemy.orm import Session
from models.user_model import User
from schemas.user_schema import UserCreate, UserUpdate
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric import rsa
import os
import hashlib

class UserController:

    def get_user(db: Session, user_id: int):
        user = db.query(User).filter(User.user_id == user_id).first()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        return user

    def get_all_users(db: Session):
        users = db.query(User).all()
        return users

    def create_user(db: Session, user: UserCreate):
        # ตรวจสอบว่า user_name มีอยู่ในฐานข้อมูลหรือไม่
        existing_user = db.query(User).filter(User.user_name == user.user_name).first()
        if existing_user:
            raise HTTPException(status_code=400, detail="Username already registered")
        
        # แฮชรหัสผ่าน
        hashed_password = hashlib.sha256(user.password.encode('utf-8')).hexdigest()

        # สร้าง RSA key pair
        private_key = rsa.generate_private_key(
            public_exponent=65537,
            key_size=2048
        )
        public_key = private_key.public_key()

        # จัดเก็บ public key ในฐานข้อมูล
        public_key_pem = public_key.public_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PublicFormat.SubjectPublicKeyInfo
        ).decode('utf-8')

        # สร้าง User object
        db_user = User(
            user_name=user.user_name,
            password=hashed_password,
            public_key=public_key_pem  # เก็บ public key ลงฐานข้อมูล
        )
        
        db.add(db_user)
        db.commit()
        db.refresh(db_user)

        # จัดเก็บ private key ลงไฟล์
        private_key_pem = private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.TraditionalOpenSSL,
            encryption_algorithm=serialization.NoEncryption()  # หรือใช้การเข้ารหัสได้
        )

        # ระบุ path สำหรับเก็บ private key
        file_path = f"keys/private_key_{db_user.user_id}.pem"
        os.makedirs(os.path.dirname(file_path), exist_ok=True)  # สร้างโฟลเดอร์ถ้ายังไม่มี
        with open(file_path, "wb") as private_key_file:
            private_key_file.write(private_key_pem)

        return db_user

    def update_user(db: Session, user_id: int, user: UserUpdate):
        db_user = db.query(User).filter(User.user_id == user_id).first()
        if not db_user:
            raise HTTPException(status_code=404, detail="User not found")
        for key, value in user.dict(exclude_unset=True).items():
            setattr(db_user, key, value)
        db.commit()
        db.refresh(db_user)
        return db_user

    def delete_user(db: Session, user_id: int):
        db_user = db.query(User).filter(User.user_id == user_id).first()
        if not db_user:
            raise HTTPException(status_code=404, detail="User not found")
        db.delete(db_user)
        db.commit()
        return {"detail": "User deleted successfully"}
