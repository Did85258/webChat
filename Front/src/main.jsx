import * as React from "react";
import * as ReactDOM from "react-dom/client";
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import "./index.css";
import App from "./App";
import Test from "./Test";
import Login from "./components/page/Login";
import Register from "./components/page/Register";
import { ProtectedRouteUser } from "./components/Protect/ProtectedRoute";
import Test2 from "./Test2";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Login />,
  },
  {
    path: "/home",
    element: <ProtectedRouteUser element={<App />} />,
  },
  {
    path: "/test",
    element: <Test2 />,
  },
  {
    path: "/login",
    element: <Login />,
  },
  {
    path: "/register",
    element: <Register />,
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);