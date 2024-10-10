import { useRef } from 'react';

function Test2() {
  const fileInputRef = useRef(null);

  const handleButtonClick = () => {
    // คลิกที่ input file โดยอัตโนมัติ
    fileInputRef.current.click();
  };

  const handleFileChange = async (e) => {
    const file = e.target.files[0];
    if (!file) {
      alert("Please select a file.");
      return;
    }

    const formData = new FormData();
    formData.append('file', file);

    try {
      const response = await fetch('http://127.0.0.1:8000/image/upload/9/8', {
        
        method: 'POST',
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQiLCJpZCI6OCwiaWF0IjoxNzI4NTcxOTA3LCJleHAiOjE3Mjg1ODI3MDd9.SbBOdfWlZsXnuDbgUEPx61benbyLQ8sh0HPynSH9yk0',
          'accept': 'application/json',
        },
        body: formData,
      });
      console.log('Upload successful:');
      if (response.ok) {
        const result = await response.json();
        console.log('Upload successful:', result);
      } else {
        console.error('Upload failed:', response.statusText);
      }
    } catch (error) {
      console.error('Error uploading file:', error);
    }
  };

  return (
    <div>
      {/* Input file ซ่อน */}
      <input
        type="file"
        ref={fileInputRef}
        style={{ display: 'none' }} // ซ่อน input
        onChange={handleFileChange}
      />
      {/* ปุ่มอัปโหลด */}
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
    </div>
  );
}

export default Test2;
