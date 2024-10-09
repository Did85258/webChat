from pydantic import BaseModel
from typing import Optional

# ใช้สำหรับสร้างและอัปเดต user
class UserBase(BaseModel):
    user_name: str

# ใช้สำหรับการสร้างผู้ใช้ (จำเป็นต้องมี password)
class UserCreate(UserBase):
    password: str

# ใช้สำหรับการอัปเดตผู้ใช้ (password ไม่จำเป็นต้องมี)
class UserUpdate(UserBase):
    password: Optional[str] = None

# ใช้สำหรับการตอบกลับ (ไม่แสดง password)
class UserOut(BaseModel):
    user_id: int
    user_name: str
    public_key: str  # เพิ่ม public_key

    class Config:
        from_attributes = True


