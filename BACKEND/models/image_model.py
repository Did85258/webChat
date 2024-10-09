from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from database import Base

class Image(Base):
    __tablename__ = "images"
    
    image_id = Column(Integer, primary_key=True, index=True)
    storage_url = Column(String, nullable=False)
    encryption_key = Column(String, nullable=False)
