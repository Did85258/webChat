import gzip
import base64
from io import BytesIO

def compress_base64_data(img_base64: str) -> str:
    
    
    # แปลง base64 string ให้เป็น bytes
    img_data = base64.b64decode(img_base64)
    
    # บีบอัดด้วย gzip
    buffer = BytesIO()
    with gzip.GzipFile(fileobj=buffer, mode='wb') as f:
        f.write(img_data)
    
    # แปลงกลับเป็น base64 ที่บีบอัดแล้ว
    compressed_img_base64 = base64.b64encode(buffer.getvalue()).decode('utf-8')
    
    return compressed_img_base64
