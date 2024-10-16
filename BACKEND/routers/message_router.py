from fastapi import APIRouter, Depends, HTTPException, Request
from sqlalchemy.orm import Session
from database import get_db
from controllers.message_controller import MessageController
from schemas.message_schema import MessageSchema,MessageResponse,MessageSchemaIMG,MessageSchemaTEXT
from typing import List
from middleware import check_permissions, decode_token

router = APIRouter()

# อ่านข้อความทั้งหมด โดย admin
@router.get("/", response_model=List[MessageSchema])
async def read_all_messages(db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return MessageController.get_all_messages(db)

# อ่านข้อความตาม ID
@router.get("/{message_id}", response_model=MessageSchema)
async def read_message(message_id: int, db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return MessageController.get_message(db, message_id)

# # สร้างข้อความใหม่
# @router.post("/", response_model=MessageSchema)
# async def create_message(message: MessageSchema, db: Session = Depends(get_db), role: str = Depends(check_permissions)):
#     return MessageController.create_message(db, message)

@router.post("/text", response_model=MessageSchemaTEXT)
async def create_messageTEXT(message: MessageSchemaTEXT, db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return MessageController.create_messageTEXT(db, message)

@router.post("/img", response_model=MessageSchemaIMG)
async def create_messageIMG(message: MessageSchemaIMG, db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return MessageController.create_messageIMG(db, message)

# อัปเดตข้อความที่มีอยู่
@router.put("/{message_id}", response_model=MessageSchema)
async def update_existing_message(message_id: int, message: MessageSchema, db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return MessageController.update_message(db, message_id, message)

# ลบข้อความที่มีอยู่
@router.delete("/{message_id}")
async def delete_existing_message(message_id: int, db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return MessageController.delete_message(db, message_id)

@router.get("/messages/{user_id_1}/{user_id_2}", response_model=List[MessageResponse])
def read_messages(user_id_1: int, user_id_2: int, db: Session = Depends(get_db)):
    return MessageController.get_messages(user_id_1, user_id_2, db)
