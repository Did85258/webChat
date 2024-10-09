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
                  <div>Hey How are you today?</div>
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
            <div className="col-start-6 col-end-13 p-3 rounded-lg">
              <div className="flex items-center justify-start flex-row-reverse">
                <div className="flex items-center justify-center h-10 w-10 rounded-full bg-indigo-500 flex-shrink-0">
                  A
                </div>
                <div className="relative mr-3 text-sm bg-indigo-100 py-2 px-4 shadow rounded-xl">
                  <div>
                    Lorem ipsum dolor sit, amet consectetur adipisicing. ?
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
                  <div>Lorem ipsum dolor sit amet !</div>
                </div>
              </div>
            </div>
            <div className="col-start-6 col-end-13 p-3 rounded-lg">
              <div className="flex items-center justify-start flex-row-reverse">
                <div className="flex items-center justify-center h-10 w-10 rounded-full bg-indigo-500 flex-shrink-0">
                  A
                </div>
                <div className="relative mr-3 text-sm bg-indigo-100 py-2 px-4 shadow rounded-xl">
                  <div>
                    Lorem ipsum dolor sit, amet consectetur adipisicing. ?
                  </div>
                  <div className="absolute text-xs bottom-0 right-0 -mb-5 mr-2 text-gray-500">
                    Seen
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
                    <img src="/src/assets/1.jpeg" className="w-56" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
