from fastapi import APIRouter, Depends, HTTPException, Request
from sqlalchemy.orm import Session
from database import get_db
from controllers.image_controller import ImageController
from schemas.image_schema import ImageSchema
from typing import List
from middleware import check_permissions, decode_token

router = APIRouter()

# อ่านภาพทั้งหมด โดย admin
@router.get("/", response_model=List[ImageSchema])
async def read_all_images(db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return ImageController.get_all_images(db)

# อ่านภาพตาม ID
@router.get("/{image_id}", response_model=ImageSchema)
async def read_image(image_id: int, db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return ImageController.get_image(db, image_id)

# สร้างภาพใหม่
@router.post("/", response_model=ImageSchema)
async def create_image(image: ImageSchema, db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return ImageController.create_image(db, image)

# อัปเดตภาพที่มีอยู่
@router.put("/{image_id}", response_model=ImageSchema)
async def update_existing_image(image_id: int, image: ImageSchema, db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return ImageController.update_image(db, image_id, image)

# ลบภาพที่มีอยู่
@router.delete("/{image_id}")
async def delete_existing_image(image_id: int, db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return ImageController.delete_image(db, image_id)
