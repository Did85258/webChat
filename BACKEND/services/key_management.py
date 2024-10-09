from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes 
import os
import base64
import secrets

KEYS_DIR = "keys"  # โฟลเดอร์ที่ใช้เก็บ private key
UPLOADS_DIR = "uploads"  # โฟลเดอร์ที่ใช้เก็บภาพ

def create_keys(user_id: int):
    """สร้างกุญแจ RSA และบันทึก private key ลงในไฟล์"""
    # สร้างกุญแจ RSA
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048,
        backend=default_backend()
    )
    
    # กำหนดที่อยู่ไฟล์สำหรับบันทึก private key
    private_key_path = os.path.join(KEYS_DIR, f"private_key_{user_id}.pem")
    
    # บันทึก private key ลงในไฟล์
    with open(private_key_path, "wb") as private_key_file:
        private_key_file.write(
            private_key.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.TraditionalOpenSSL,
                encryption_algorithm=serialization.NoEncryption()  # สามารถใส่รหัสผ่านได้ถ้าต้องการ
            )
        )
    
    # สร้าง public key
    public_key = private_key.public_key()
    return public_key

def save_public_key(public_key, user_id: int):
    """บันทึก public key ลงในฐานข้อมูล"""
    public_key_bytes = public_key.public_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PublicFormat.SubjectPublicKeyInfo
    )

    # แปลง public key เป็น string เพื่อบันทึกในฐานข้อมูล
    public_key_str = public_key_bytes.decode('utf-8')

    # คืนค่า public key string
    return public_key_str

def load_private_key(user_id: int):
    """โหลด private key จากไฟล์"""
    private_key_path = os.path.join(KEYS_DIR, f"private_key_{user_id}.pem")

    with open(private_key_path, "rb") as private_key_file:
        private_key = serialization.load_pem_private_key(
            private_key_file.read(),
            password=None,  # ถ้าใช้รหัสผ่านให้ใส่ที่นี่
            backend=default_backend()
        )
    
    return private_key


# ฟังก์ชันสำหรับการสร้าง AES key
def generate_aes_key() -> bytes:
    return secrets.token_bytes(32)  # 32 bytes = 256 bits

# ฟังก์ชันสำหรับการเข้ารหัส AES
def encrypt_aes_key(aes_key: bytes, public_key) -> str:
    ciphertext = public_key.encrypt(
        aes_key,
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )
    return base64.b64encode(ciphertext).decode('utf-8')

# ฟังก์ชันสำหรับการเข้ารหัสรูปภาพด้วย AES
def encrypt_image(image_data: bytes, aes_key: bytes) -> bytes:
    iv = os.urandom(16)  # สุ่ม IV
    cipher = Cipher(algorithms.AES(aes_key), modes.CFB(iv), backend=default_backend())
    encryptor = cipher.encryptor()
    encrypted_data = iv + encryptor.update(image_data) + encryptor.finalize()  # แทรก IV ไว้ข้างหน้า
    return encrypted_data
