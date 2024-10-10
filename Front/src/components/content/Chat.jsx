import { useState } from "react";

export default function Chat() {
  const [isOpen, setIsOpen] = useState(false); // state สำหรับเปิด/ปิด modal
  const [selectedImage, setSelectedImage] = useState(""); // state สำหรับเก็บ URL ของภาพที่เลือก

  const handleImageClick = (imageSrc) => {
    setSelectedImage(imageSrc); // ตั้งค่า URL ของภาพที่เลือก
    setIsOpen(true); // เปิด modal
  };

  const handleCloseModal = () => {
    setIsOpen(false); // ปิด modal
    setSelectedImage(""); // เคลียร์ URL ของภาพ
  };

  const [messageData, setMessageData] = useState([]);

  const fetchChatData = async () => {
    try {
      const token = localStorage.getItem("userToken");
      const userId1 = localStorage.getItem("userId");
      const userId2 = 7;

      if (!token) {
        console.error("No token found");
        setError("No token found");
        return;
      }
      const responseMessage = await fetch(
        `${BASE_URL}/message/messages/${userId1}/${userId2}`,
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
      // console.log(responseUsers);

      const resultMessage = await responseMessage.json();
      console.log(resultMessage);
      if (resultMessage) {
        setMessageData(resultMessage);
      } else {
        throw new Error("Data received is not an array");
      }
    } catch (error) {
      console.error("Fetch error:", error.message);
      setError("Failed to fetch data from server.");
    }
  };
  return (
    <>
      <div className="flex  flex-auto flex-shrink-0 bg-white rounded-xl  p-3 px-7 ">
        <div className="flex items-center justify-center h-12 w-12 rounded-full bg-indigo-500 flex-shrink-0">
          A
        </div>
        <div className="relative ml-3 text-xl bg-white py-2 px-2 ">
          <div>Alex Arnold</div>
        </div>
      </div>
      <div className="flex flex-col h-full overflow-x-auto mb-4 ">
        <div className="flex flex-col h-full">
          <div className="grid grid-cols-12 gap-y-2 ">
            <div className="col-start-1 col-end-8 p-3 rounded-lg">
              <div className="flex flex-row items-center">
                <div className="flex items-center justify-center h-10 w-10 rounded-full bg-indigo-500 flex-shrink-0">
                  A
                </div>
                <div className="relative ml-3 text-sm bg-white py-2 px-4 shadow rounded-xl">
                  <div>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                    Vel ipsa commodi illum saepe numquam maxime asperiores
                    voluptate sit, minima perspiciatis.
                  </div>
                </div>
              </div>
            </div>

            <div className="col-start-6 col-end-13 p-3 rounded-lg">
              <div className="flex items-center justify-start flex-row-reverse">
                <div className="flex items-center justify-center h-10 w-10 rounded-full bg-indigo-500 flex-shrink-0">
                  A
                </div>
                <div className="relative mr-3 text-sm bg-indigo-100 py-2 px-4 shadow rounded-xl">
                  <div>I'm ok what about you?</div>
                </div>
              </div>
            </div>

            <div className="col-start-1 col-end-8 p-3 rounded-lg">
              <div className="flex flex-row items-center">
                <div className="flex items-center justify-center h-10 w-10 rounded-full bg-indigo-500 flex-shrink-0">
                  A
                </div>
                <div className="relative ml-3 text-sm bg-white py-2 px-4 shadow rounded-xl">
                  <div>
                    <img
                      src="/src/assets/1.jpeg"
                      className="w-56 cursor-pointer"
                      onClick={() =>
                        handleImageClick("/src/assets/vector-users-icon.jpg")
                      } // เรียกใช้งานฟังก์ชันเมื่อคลิกที่รูปภาพ
                      alt="Thumbnail"
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      {/* Modal สำหรับแสดงรูปภาพขนาดเต็ม */}
      {isOpen && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
          <div className="relative">
            <img
              src={selectedImage}
              className="max-w-full max-h-screen" // จำกัดความสูงไม่ให้เกินหน้าจอ
              alt="Full Size"
            />
            <button
              onClick={handleCloseModal}
              className="absolute top-2 right-2 text-white bg-red-600 rounded-full p-2"
            >
              X
            </button>
          </div>
        </div>
      )}
    </>
  );
}
