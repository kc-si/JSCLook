import React from "react";
import { Link, Outlet } from "react-router-dom";

export const NavBar = () => {
  return (
    <div className="m-2">
      <nav>
        <Link to="companies">Companies</Link> {"| "}
        <Link to="shareholders">Shareholders</Link>
      </nav>
      <Outlet />
    </div>
  );
}
