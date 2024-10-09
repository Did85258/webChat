from fastapi import WebSocket, WebSocketDisconnect
from typing import List

# เก็บการเชื่อมต่อของ WebSocket
connections: List[WebSocket] = []

async def websocket_endpoint(websocket: WebSocket, user_id: int):
    await websocket.accept()
    connections.append(websocket)

    try:
        while True:
            data = await websocket.receive_text()  # รับข้อความจากผู้ใช้
            # ส่งข้อความไปยังผู้ใช้คนอื่น ๆ
            for connection in connections:
                if connection != websocket:  # ส่งไปยังผู้ใช้คนอื่น
                    await connection.send_text(f"User {user_id}: {data}")

    except WebSocketDisconnect:
        connections.remove(websocket)  # ลบการเชื่อมต่อเมื่อผู้ใช้ตัดการเชื่อมต่อ
