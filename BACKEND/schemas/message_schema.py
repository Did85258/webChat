from pydantic import BaseModel
from datetime import datetime

class MessageSchema(BaseModel):
    message_id: int
    sender_id: int
    receiver_id: int
    timestamp: datetime
    content: str
    image_id: int
    message_type: bool


class MessageBase(BaseModel):
    sender_id: int
    receiver_id: int

class MessageCreate(MessageBase):
    pass

class MessageResponse(MessageBase):
    message_id: int
    timestamp: datetime

    class Config:
        from_attributes = True
