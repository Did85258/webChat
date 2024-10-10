from pydantic import BaseModel

class ImageSchema(BaseModel):
    encryption_key: str
    storage_url: str

class ImageBase(BaseModel):
    storage_url: str
    encryption_key: str

class ImageCreate(ImageBase):
    image_path: str
    encryption_key: str

class ImageResponse(BaseModel):
    image_id: int
    image_path: str
    encryption_key: str

    class Config:
        from_attributes = True
