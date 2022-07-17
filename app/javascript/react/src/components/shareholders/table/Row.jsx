import React from "react";
import { Link } from "react-router-dom";

export const Row = ({ shareholder, index }) => {
  return (
    <tr>
      <td className="text-muted" >{index + 1}</td>
      <td ><Link to={`${shareholder.id}`} className="nav-link p-0">{shareholder.name}</Link></td>
    </tr>
  );
};
