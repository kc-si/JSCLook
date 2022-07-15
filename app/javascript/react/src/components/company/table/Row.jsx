import React from "react";

export const Row = ({ company, index, onNameClick }) => {
  const handleClick = () => {
    onNameClick(company.id);
  };

  return (
    <tr>
      <td className="text-muted">{index + 1}</td>
      <td><button className="btn nav-link p-0" onClick={handleClick}>{company.name}</button></td>
    </tr>
  );
}
