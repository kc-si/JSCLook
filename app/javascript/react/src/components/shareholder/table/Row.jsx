import React from "react";
import { Link } from "react-router-dom";

export const Row = ({ company, shares_count, index }) => {
  return (
    <tr>
      <td className="text-muted" >{index + 1}</td>
      <td ><Link to={''} className="nav-link text-muted p-0">{company.name}</Link></td>
      <td className="text-muted" >{company.isin}</td>
      <td className="text-muted" >{company.stock}</td>
      <td className="text-muted" >{shares_count}</td>
    </tr>
  );
};
