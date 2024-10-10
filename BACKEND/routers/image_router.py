from fastapi import APIRouter, Depends, HTTPException, Request, File, UploadFile
from sqlalchemy.orm import Session
from database import get_db
from controllers.image_controller import ImageController
from schemas.image_schema import ImageSchema,ImageResponse
from typing import List
from middleware import check_permissions, decode_token
from fastapi.responses import StreamingResponse
from io import BytesIO
from models.user_model import User

router = APIRouter()

# อ่านภาพทั้งหมด โดย admin
@router.get("/", response_model=List[ImageSchema])
async def read_all_images(db: Session = Depends(get_db), role: str = Depends(check_permissions)):
    return ImageController.get_all_images(db)

# # อ่านภาพตาม ID
# @router.get("/{image_id}", response_model=ImageSchema)
# async def read_image(image_id: int, db: Session = Depends(get_db), role: str = Depends(check_permissions)):
#     return ImageController.get_image(db, image_id)

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

@router.post("/upload/{sender_id}/{receiver_id}", response_model=ImageResponse)
async def upload_image_route(sender_id: int, receiver_id: int, file: UploadFile = File(...), db: Session = Depends(get_db)):
    return await ImageController.upload_image(sender_id, receiver_id, file, db)


# @router.get("/image111/{image_id}/{receiver_id}")
# async def get_image(image_id: int,receiver_id: int, db: Session = Depends(get_db)):
#     try:
#         # เรียกใช้ฟังก์ชันถอดรหัสภาพ
#         image_data = ImageController.decrypt_image(db, image_id, receiver_id)
        
#         # สร้าง BytesIO object เพื่อส่งภาพ
#         image_stream = BytesIO(image_data)
#         image_stream.seek(0)
        
#         return StreamingResponse(image_stream, media_type="image/jpeg")
#     except Exception as e:
#         raise HTTPException(status_code=500, detail=str(e))