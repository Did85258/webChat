import { useRef } from "react";
import Chat from "./Chat";
import ChosePeople from "./ChosePeople";

export default function Content() {
  const fileInputRef = useRef(null); // สร้าง reference สำหรับ input file

  const handleButtonClick = () => {
    // เมื่อคลิกปุ่มให้เปิด dialog ของ input file
    fileInputRef.current.click();
  };

  const handleFileChange = (event) => {
    const file = event.target.files[0]; // เข้าถึงไฟล์ที่ผู้ใช้เลือก
    if (file) {
      // ทำการประมวลผลไฟล์ที่เลือกได้ที่นี่
      console.log("Selected file:", file);
      // คุณสามารถแสดงตัวอย่างภาพได้หากต้องการ
      const reader = new FileReader();
      reader.onload = (e) => {
        console.log("Image preview:", e.target.result);
        // สามารถแสดงภาพที่นี่ได้
      };
      reader.readAsDataURL(file);
    }
  };

  return (
    <div className="flex h-[89vh] antialiased text-gray-800">
      <div className="flex flex-row h-full w-full overflow-x-hidden">
        <ChosePeople />

        <div className="flex flex-col flex-auto  h-full p-6">
          <div className="flex flex-col flex-auto flex-shrink-0 rounded-2xl bg-gray-100 h-full p-4 ">
            <Chat />
            <div className="flex flex-row items-center h-16 rounded-xl bg-white w-full px-4">
              <div>
                <button
                  className="flex items-center justify-center text-gray-400 hover:text-gray-600"
                  onClick={handleButtonClick}
                >
                  <svg
                    className="w-5 h-5"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth="2"
                      d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"
                    ></path>
                  </svg>
                </button>

                {/* ซ่อน input file */}
                <input
                  type="file"
                  ref={fileInputRef}
                  onChange={handleFileChange}
                  className="hidden"
                  accept="image/*" // จำกัดเฉพาะไฟล์ภาพ
                />
              </div>
              <div className="flex-grow ml-4">
                <div className="relative w-full">
                  <input
                    type="text"
                    className="flex w-full border rounded-xl focus:outline-none focus:border-indigo-300 pl-4 h-10"
                  />
                </div>
              </div>
              <div className="ml-4">
                <button className="flex items-center justify-center bg-indigo-500 hover:bg-indigo-600 rounded-xl text-white px-4 py-1 flex-shrink-0">
                  <span>Send</span>
                  <span className="ml-2">
                    <svg
                      className="w-4 h-4 transform rotate-45 -mt-px"
                      fill="none"
                      stroke="currentColor"
                      viewBox="0 0 24 24"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        strokeWidth="2"
                        d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"
                      ></path>
                    </svg>
                  </span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
