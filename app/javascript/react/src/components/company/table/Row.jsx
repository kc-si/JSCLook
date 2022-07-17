import React from "react";

export const Row = ({ company, index, onNameClick }) => {
  const handleClick = () => {
    onNameClick(company.id);
  };

  return (
    <tr>
      <td className="pe-0 me-0"><button className="btn nav-link p-0 m-0" onClick={handleClick}>{company.name}</button></td>
    </tr>
  );
}
