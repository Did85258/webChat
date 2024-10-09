// import React, { useRef, useState } from 'react';

// export default function ImageUploadButton() {
//   const fileInputRef = useRef(null); // สร้าง reference สำหรับ input file
//   const [imageSrc, setImageSrc] = useState(null); // state เพื่อเก็บ URL ของภาพที่เลือก

//   const handleButtonClick = () => {
//     // เมื่อคลิกปุ่มให้เปิด dialog ของ input file
//     fileInputRef.current.click();
//   };

//   const handleFileChange = (event) => {
//     const file = event.target.files[0]; // เข้าถึงไฟล์ที่ผู้ใช้เลือก
//     if (file) {
//       // ทำการสร้าง URL สำหรับภาพที่เลือก
//       const reader = new FileReader();
//       reader.onload = (e) => {
//         setImageSrc(e.target.result); // ตั้งค่า imageSrc เป็น URL ของภาพ
//       };
//       reader.readAsDataURL(file);
//     }
//   };

//   return (
//     <div className="flex flex-col items-center">
//       <button
//         className="flex items-center justify-center text-gray-400 hover:text-gray-600 mb-4"
//         onClick={handleButtonClick}
//       >
//         <svg
//           className="w-5 h-5"
//           fill="none"
//           stroke="currentColor"
//           viewBox="0 0 24 24"
//           xmlns="http://www.w3.org/2000/svg"
//         >
//           <path
//             strokeLinecap="round"
//             strokeLinejoin="round"
//             strokeWidth="2"
//             d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"
//           ></path>
//         </svg>
//       </button>

//       {/* ซ่อน input file */}
//       <input
//         type="file"
//         ref={fileInputRef}
//         onChange={handleFileChange}
//         className="hidden"
//         accept="image/*" // จำกัดเฉพาะไฟล์ภาพ
//       />

//       {/* แสดงภาพเมื่อมีการเลือก */}
//       {imageSrc && (
//         <img
//           src={imageSrc}
//           alt="Selected"
//           className="mt-4 border rounded-lg"
//           style={{ maxWidth: '300px', maxHeight: '300px' }} // จำกัดขนาดภาพ
//         />
//       )}
//     </div>
//   );
// }
import React, { useState } from 'react';

export default function ImageModal() {
  const [isOpen, setIsOpen] = useState(false); // state สำหรับเปิด/ปิด modal
  const [selectedImage, setSelectedImage] = useState(''); // state สำหรับเก็บ URL ของภาพที่เลือก

  const handleImageClick = (imageSrc) => {
    setSelectedImage(imageSrc); // ตั้งค่า URL ของภาพที่เลือก
    setIsOpen(true); // เปิด modal
  };

  const handleCloseModal = () => {
    setIsOpen(false); // ปิด modal
    setSelectedImage(''); // เคลียร์ URL ของภาพ
  };

  return (
    <div>
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
                onClick={() => handleImageClick('/src/assets/1.jpeg')} // เรียกใช้งานฟังก์ชันเมื่อคลิกที่รูปภาพ
                alt="Thumbnail"
              />
            </div>
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
                src="/src/assets/vector-users-icon.jpg"
                className="w-56 cursor-pointer"
                onClick={() => handleImageClick('/src/assets/vector-users-icon.jpg')} // เรียกใช้งานฟังก์ชันเมื่อคลิกที่รูปภาพ
                alt="Thumbnail"
              />
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
    </div>
  );
}
