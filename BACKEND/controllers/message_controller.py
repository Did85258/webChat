from fastapi import HTTPException
from sqlalchemy.orm import Session
from models.message_model import Message
from schemas.message_schema import MessageSchema

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
