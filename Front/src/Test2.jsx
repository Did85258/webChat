import React, { useEffect, useState } from "react";
import pako from "pako";

const BASE_URL = "http://127.0.0.1:8000";

const Test2 = () => {
  const [messageData, setMessageData] = useState([]);
  const [imageSrcs, setImageSrcs] = useState([]); // สถานะสำหรับ URL ของภาพหลายๆ รูป

  useEffect(() => {
    const fetchChatData = async () => {
      try {
        const token = "YOUR_TOKEN"; // ใส่โทเค็นที่คุณต้องการ

        const responseMessage = await fetch(
          `${BASE_URL}/message/messages/8/9`,
          {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${token}`,
            },
          }
        );

        if (!responseMessage.ok) {
          throw new Error(`HTTP error! status: ${responseMessage.status}`);
        }

        const resultMessage = await responseMessage.json();
        if (resultMessage) {
          setMessageData(resultMessage);
          const urls = []; // สร้างอาเรย์เพื่อเก็บ URL ของภาพ

          // ตรวจสอบและถอดบีบอัด imageBase64 สำหรับแต่ละข้อความ
          for (const row of resultMessage) {
            if (row.imageBase64) {
              const compressedBase64 = row.imageBase64;
              const compressedData = Uint8Array.from(atob(compressedBase64), c => c.charCodeAt(0));
              const decompressedData = pako.inflate(compressedData); // ถอดบีบอัด Gzip
              const imageBlob = new Blob([decompressedData], { type: "image/jpg" });
              const imageUrl = URL.createObjectURL(imageBlob);
              urls.push(imageUrl); // เพิ่ม URL ของภาพในอาเรย์
            }
          }

          setImageSrcs(urls); // ตั้งค่าอาเรย์ URL ของภาพ
        } else {
          throw new Error("Data received is not an array");
        }
      } catch (error) {
        console.error("Fetch error:", error.message);
        setMessageData([]);
      }
    };

    fetchChatData();
  }, []);

  console.log(messageData);
  console.log(imageSrcs);

  return (
    <div>
      {/* แสดงภาพหลายๆ รูป */}
      {imageSrcs.map((src, index) => (
        <img key={index} src={src} alt={`Fetched ${index}`} />
      ))}
      {/* แสดงข้อมูลเพิ่มเติมจาก messageData */}
      {messageData.map((row, index) => (
        <div
          key={index}
          className="relative mr-3 text-sm bg-indigo-100 py-2 px-4 shadow rounded-xl"
        >
          <div>{row.content}</div>
        </div>
      ))}
    </div>
  );
};

export default Test2;
