import { useEffect } from "react";
import { useState } from "react";
const BASE_URL = "http://127.0.0.1:8000";
export default function ChosePeople() {
  const [usersData, setUsersData] = useState([]);
  useEffect(() => {
    const fetchUsersData = async () => {
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
          setUsersData(resultUsers);
        } else {
          throw new Error("Data received is not an array");
        }
      } catch (error) {
        console.error("Fetch error:", error.message);
        setError("Failed to fetch data from server.");
      }
    };

    fetchUsersData();
  }, []);
  return (
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
  );
}
