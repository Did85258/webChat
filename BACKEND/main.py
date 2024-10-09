from fastapi import FastAPI, Depends
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import HTTPBearer
from fastapi.openapi.utils import get_openapi
from routers import auth_router, user__router, image_router, message_router
from database import engine, Base
from websocket import websocket_endpoint

# สร้างฐานข้อมูล
Base.metadata.create_all(bind=engine)

app = FastAPI()

# เพิ่ม WebSocket endpoint
app.websocket("/ws/chat/{user_id}")(websocket_endpoint)

# กำหนด CORS (Cross-Origin Resource Sharing) ถ้าจำเป็น
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # เปลี่ยนเป็น URL ของคุณถ้าต้องการจำกัด
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ใช้ HTTPBearer สำหรับการส่ง Bearer Token
bearer_scheme = HTTPBearer()

# รวม router
app.include_router(auth_router.router, prefix="/auth", tags=["auth"])
app.include_router(user__router.router, prefix="/user", tags=["user"])
app.include_router(image_router.router, prefix="/image", tags=["image"])
app.include_router(message_router.router, prefix="/message", tags=["message"])


@app.get("/")
def read_root():
    return {"message": "Web Chat Application"}

# Custom OpenAPI เพื่อรองรับ Bearer Token ใน Swagger UI
def custom_openapi():
    if app.openapi_schema:
        return app.openapi_schema
    openapi_schema = get_openapi(
        title="Web Chat Application API",
        version="1.0.0",
        description="API documentation for the Web Chat Application",
        routes=app.routes,
    )
    # เพิ่ม HTTPBearer Token ใน security schemes
    openapi_schema["components"]["securitySchemes"] = {
        "BearerAuth": {
            "type": "http",
            "scheme": "bearer",
            "bearerFormat": "JWT"  # หรือเปลี่ยนเป็นอะไรก็ได้ตามที่คุณใช้
        }
    }
    # เพิ่ม security ให้ API ทุกส่วนสามารถใช้ HTTPBearer ได้
    openapi_schema["security"] = [{"BearerAuth": []}]
    app.openapi_schema = openapi_schema
    return app.openapi_schema

# กำหนดให้ app ใช้ custom OpenAPI schema
app.openapi = custom_openapi
