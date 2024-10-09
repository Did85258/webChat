from fastapi import HTTPException
from sqlalchemy.orm import Session
from models.message_model import Message
from models.user_model import User
from schemas.message_schema import MessageSchema ,MessageResponse

class MessageController:

    def get_message(db: Session, message_id: int):
        message = db.query(Message).filter(Message.message_id == message_id).first()
        if not message:
            raise HTTPException(status_code=404, detail="Message not found")
        return message

    def get_all_messages(db: Session):
        messages = db.query(Message).all()
        return messages

    def create_message(db: Session, message: MessageSchema):
        db_message = Message(**message.dict())
        db.add(db_message)
        db.commit()
        db.refresh(db_message)
        return db_message

    def update_message(db: Session, message_id: int, message_data: MessageSchema):
        db_message = db.query(Message).filter(Message.message_id == message_id).first()
        if not db_message:
            raise HTTPException(status_code=404, detail="Message not found")
        
        for key, value in message_data.dict(exclude_unset=True).items():
            setattr(db_message, key, value)
        
        db.commit()
        db.refresh(db_message)
        return db_message

    def delete_message(db: Session, message_id: int):
        db_message = db.query(Message).filter(Message.message_id == message_id).first()
        if not db_message:
            raise HTTPException(status_code=404, detail="Message not found")
        
        db.delete(db_message)
        db.commit()
        return {"detail": "Message deleted successfully"}
    
    def get_messages(user_id_1: int, user_id_2: int, db: Session):
        # ค้นหาข้อความที่ส่งระหว่าง user_id_1 และ user_id_2
        messages = db.query(Message).filter(
            (Message.sender_id == user_id_1) & (Message.receiver_id == user_id_2) |
            (Message.sender_id == user_id_2) & (Message.receiver_id == user_id_1)
        ).all()

        if not messages:
            raise HTTPException(status_code=404, detail="No messages found")

        response = []
        for message in messages:
            sender_username = db.query(User).filter(User.user_id == message.sender_id).first().user_name
            receiver_username = db.query(User).filter(User.user_id == message.receiver_id).first().user_name

            response.append({
                "message_id": message.message_id,
                "sender_id": message.sender_id,
                "receiver_id": message.receiver_id,
                "content": message.content,
                "timestamp": message.timestamp.isoformat(),  # แปลงเป็น string
                "message_type": message.message_type,
                "sender_username": sender_username,
                "receiver_username": receiver_username
            })

        return response
    

