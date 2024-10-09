from sqlalchemy import Column, Integer, String, Text
#from database.connection import Base
from database import Base
class User(Base):
    __tablename__ = "user"

    user_id = Column(Integer, primary_key=True, index=True)
    user_name = Column(String(255), unique=True, index=True)
    password = Column(String, nullable=False)
    public_key = Column(Text, nullable=False)  # สำหรับเก็บ public key

    def __repr__(self):
        return f"<User(user_id={self.user_id}, user_name='{self.user_name}')>"

