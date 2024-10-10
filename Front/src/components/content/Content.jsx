import { useEffect, useRef, useState } from "react";
import Chat from "./Chat";
const BASE_URL = "http://127.0.0.1:8000";
export default function Content() {
  const fileInputRef = useRef(null); // สร้าง reference สำหรับ input file
  const [username2, setNameChatWith] = useState("");
  const userId1 = localStorage.getItem("userId");
  const userName1 = localStorage.getItem("userName");
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

  //chose people
  const [usersData, setUsersData] = useState([]);
  useEffect(() => {
    const fetcUsersData = async () => {
      try {
        const token = localStorage.getItem("userToken");

        if (!token) {
          console.error("No token found");
          setError("No token found");
          return;
        }
        const responseUsers = await fetch(`${BASE_URL}/user/`, {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`,
          },
        });

        if (!responseUsers.ok) {
          throw new Error(`HTTP error! status: ${responseUsers.status}`);
        }
        // console.log(responseUsers);

        const resultUsers = await responseUsers.json();
        console.log(resultUsers);
        if (resultUsers) {
          const filteredUsers = resultUsers.filter(
            (user) => user.user_id != userId1
          );
          setUsersData(filteredUsers);
        } else {
          throw new Error("Data received is not an array");
        }
      } catch (error) {
        console.error("Fetch error:", error.message);
        setError("Failed to fetch data from server.");
      }
    };

    fetcUsersData();
  }, []);
  //chose people

  //chat
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

  const fetchChatData = async (id2) => {
    try {
      const token = localStorage.getItem("userToken");
      const userId1 = localStorage.getItem("userId");
      const userId2 = id2;

      if (!token) {
        console.error("No token found");
        setError("No token found");
        return;
      }
      console.log(userId2);
      console.log(userId1);
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
      setMessageData([]);
      setError("Failed to fetch data from server.");
    }
  };
  //chat

  const handleOpenChat = (userId2, name2) => {
    fetchChatData(userId2);
    setNameChatWith(name2);
  };

  return (
    <div className="flex h-[89vh] antialiased text-gray-800">
      <div className="flex flex-row h-full w-full overflow-x-hidden">
        <div className="bg-white p-2">
          <div className="flex h-full flex-col py-2 pl-6 pr-2 w-64 bg-zinc-200  flex-shrink-0 overflow-y-auto">
            <div className="flex flex-col mt-8 ">
              <div className="flex flex-row items-center justify-between text-xs ">
                <span className="font-bold">People message</span>
              </div>
              <div className="flex flex-col space-y-1 mt-4 -mx-2 h overflow-y-auto mr-2">
                {usersData.map((row, index) => (
                  <button
                    key={index}
                    className="flex flex-row items-center hover:bg-gray-100 rounded-xl p-2"
                    onClick={() => handleOpenChat(row.user_id, row.user_name)}
                  >
                    <div className="flex items-center justify-center h-8 w-8 bg-indigo-200 rounded-full">
                      {row.user_name.substring(0, 1).toUpperCase()}
                    </div>
                    <div className="ml-2 text-sm font-semibold">
                      {row.user_name}
                    </div>
                  </button>
                ))}
              </div>
            </div>
          </div>
        </div>

        <div className="flex flex-col flex-auto  h-full p-6">
          <div className="flex flex-col flex-auto flex-shrink-0 rounded-2xl bg-gray-100 h-full p-4 ">
            <div className="flex  flex-auto flex-shrink-0 bg-white rounded-xl  p-3 px-7 ">
              <div className="flex text-white items-center justify-center h-12 w-12 rounded-full bg-indigo-500 flex-shrink-0">
                {username2.substring(0, 1).toUpperCase()}
              </div>
              <div className="relative  ml-3 text-xl bg-white py-2 px-2 ">
                <div>{username2}</div>
              </div>
            </div>
            <div className="flex flex-col h-full overflow-x-auto mb-4 ">
              <div className="flex flex-col h-full">
                <div className="grid grid-cols-12 gap-y-2 ">
                  {/* messageData */}
                  {messageData.map((row, index) =>
                    row.sender_id == userId1 ? (
                      <div
                        key={index}
                        className="col-start-6 col-end-13 p-3 rounded-lg"
                      >
                        <div className="flex items-center justify-start flex-row-reverse">
                          <div className="flex text-white items-center justify-center h-10 w-10 rounded-full bg-indigo-500 flex-shrink-0">
                            {userName1.substring(0, 1).toUpperCase()}
                          </div>
                          {row.message_type == 0 && (
                            <div className="relative mr-3 text-sm bg-indigo-100 py-2 px-4 shadow rounded-xl">
                              <div>{row.content}</div>{" "}
                              {/* แสดงข้อความที่ถูกส่ง */}
                            </div>
                          )}
                          {row.message_type == 1 && (
                            <div className="relative ml-3 text-sm bg-white py-2 px-4 shadow rounded-xl">
                              <div>
                                <img
                                  src="/src/assets/1.jpeg"
                                  className="w-56 cursor-pointer"
                                  onClick={() =>
                                    handleImageClick("/src/assets/1.jpeg")
                                  } // เรียกใช้งานฟังก์ชันเมื่อคลิกที่รูปภาพ
                                  alt="Thumbnail"
                                />
                              </div>
                            </div>
                          )}
                        </div>
                      </div>
                    ) : (
                      <div
                        key={index}
                        className="col-start-1 col-end-8 p-3 rounded-lg"
                      >
                        <div className="flex flex-row items-center">
                          <div className="flex text-white items-center justify-center h-10 w-10 rounded-full bg-indigo-500 flex-shrink-0">
                            {username2.substring(0, 1).toLocaleUpperCase()}
                          </div>
                          {row.message_type == 0 && (
                            <div className="relative ml-3 text-sm bg-white py-2 px-4 shadow rounded-xl">
                              <div>{row.content}</div>
                            </div>
                          )}
                          {row.message_type == 1 && (
                            <div className="relative ml-3 text-sm bg-white py-2 px-4 shadow rounded-xl">
                              <div>
                                <img
                                  src="/src/assets/1.jpeg"
                                  className="w-56 cursor-pointer"
                                  onClick={() =>
                                    handleImageClick(
                                      "/src/assets/vector-users-icon.jpg"
                                    )
                                  } // เรียกใช้งานฟังก์ชันเมื่อคลิกที่รูปภาพ
                                  alt="Thumbnail"
                                />
                              </div>
                            </div>
                          )}
                        </div>
                      </div>
                    )
                  )}
                  <div
                        
                        className="col-start-1 col-end-8 p-3 rounded-lg"
                      >
                        <div className="flex flex-row items-center">
                          <div className="flex text-white items-center justify-center h-10 w-10 rounded-full bg-indigo-500 flex-shrink-0">
                            {username2.substring(0, 1).toLocaleUpperCase()}
                          </div>

                            {/* <div className="relative ml-3 text-sm bg-white py-2 px-4 shadow rounded-xl">
                              <div>hello</div>
                            </div> */}
   
                            <div className="relative ml-3 text-sm bg-white py-2 px-4 shadow rounded-xl">
                              <div>
                                <img
                                  src="/src/assets/1.jpeg"
                                  className="w-56 cursor-pointer"
                                  onClick={() =>
                                    handleImageClick(
                                      "/src/assets/vector-users-icon.jpg"
                                    )
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
                <div className=" w-full">
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
