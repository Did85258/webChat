from fastapi import HTTPException
from sqlalchemy.orm import Session
from models.image_model import Image
from schemas.image_schema import ImageSchema

class ImageController:

    def get_image(db: Session, image_id: int):
        image = db.query(Image).filter(Image.image_id == image_id).first()
        if not image:
            raise HTTPException(status_code=404, detail="Image not found")
        return image

    def get_all_images(db: Session):
        images = db.query(Image).all()
        return images

    def create_image(db: Session, image: ImageSchema):
        db_image = Image(**image.dict())
        db.add(db_image)
        db.commit()
        db.refresh(db_image)
        return db_image

    def update_image(db: Session, image_id: int, image_data: ImageSchema):
        db_image = db.query(Image).filter(Image.image_id == image_id).first()
        if not db_image:
            raise HTTPException(status_code=404, detail="Image not found")
        
        for key, value in image_data.dict(exclude_unset=True).items():
            setattr(db_image, key, value)
        
        db.commit()
        db.refresh(db_image)
        return db_image

    def delete_image(db: Session, image_id: int):
        db_image = db.query(Image).filter(Image.image_id == image_id).first()
        if not db_image:
            raise HTTPException(status_code=404, detail="Image not found")
        
        db.delete(db_image)
        db.commit()
        return {"detail": "Image deleted successfully"}
