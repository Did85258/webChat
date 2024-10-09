import "./App.css";
import Content from "./components/content/Content";
import UserNavbar from "./components/navbar/UserNavbar";

export default function App() {
  return (
    <>
    <div className="h-screen">
      <UserNavbar />
      <Content />
    </div>
      
    </>
  );
}
