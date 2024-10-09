from pydantic import BaseModel
from datetime import datetime
from typing import List

class MessageSchema(BaseModel):
    sender_id: int
    receiver_id: int
    timestamp: str
    content: str
    image_id: int
    message_type: bool


class MessageBase(BaseModel):
    sender_id: int
    receiver_id: int

class MessageCreate(MessageBase):
    pass

class MessageResponse(BaseModel):
    message_id: int
    sender_id: int
    receiver_id: int
    content: str
    timestamp: str
    message_type: int
    sender_username: str
    receiver_username: str

    class Config:
        from_attributes = True
