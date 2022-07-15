import React from "react";
import { Link } from "react-router-dom";

export const Row = ({ company, index }) => {
  return (
    <tr>
      <td className="text-muted" >{index + 1}</td>
      <td ><Link to={`${company.id}`} className="nav-link p-0">{company.name}</Link></td>
      <td className="text-muted" >{company.isin}</td>
      <td className="text-muted" >{company.stock}</td>
      <td className="text-muted" >{company.shares_amount}</td>
    </tr>
  );
};
