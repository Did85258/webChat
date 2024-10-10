from pydantic import BaseModel, Field
from datetime import datetime
from typing import List, Optional

class MessageSchema(BaseModel):
    sender_id: int
    receiver_id: int
    timestamp: str
    content: str
    image_id: int
    message_type: bool

class MessageSchemaIMG(BaseModel):
    sender_id: int
    receiver_id: int
    image_id: int

class MessageSchemaTEXT(BaseModel):
    sender_id: int
    receiver_id: int
    content: str

class MessageBase(BaseModel):
    sender_id: int
    receiver_id: int

class MessageCreate(MessageBase):
    pass

class MessageResponse(BaseModel):
    message_id: int
    sender_id: int
    receiver_id: int
    content: Optional[str] = ""  # ให้ default เป็น string ว่าง
    imageBase64: str
    timestamp: str
    message_type: int
    sender_username: str
    receiver_username: str

    class Config:
        from_attributes = True
