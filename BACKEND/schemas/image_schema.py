from pydantic import BaseModel

class ImageSchema(BaseModel):
    image_id: int
    encryption_key: str
    storage_url: str

class ImageBase(BaseModel):
    storage_url: str
    encryption_key: str

class ImageCreate(ImageBase):
    user_id: int

class ImageResponse(ImageBase):
    image_id: int

    class Config:
        from_attributes = True
