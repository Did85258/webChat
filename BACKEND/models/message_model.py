from sqlalchemy import Column, Integer, ForeignKey, DateTime, String, Boolean
from database import Base
from datetime import datetime
from sqlalchemy.orm import relationship

class Message(Base):
    __tablename__ = "messages"
    
    message_id = Column(Integer, primary_key=True, index=True)
    sender_id = Column(Integer, ForeignKey("user.user_id"))
    receiver_id = Column(Integer, ForeignKey("user.user_id"))
    timestamp = Column(DateTime, default=datetime.utcnow)
    content = Column(String, nullable=False)
    image_id = Column(Integer, ForeignKey("images.image_id"))
    message_type = Column(Boolean, nullable=False)

    sender = relationship("User", foreign_keys=[sender_id])
    receiver = relationship("User", foreign_keys=[receiver_id])
    image = relationship("Image", foreign_keys=[image_id])
