import React from "react";

export const Shareholder = ({ shareholder }) => {
  return (
    <div>
      <hr className="mt-4"/>
      <p>{shareholder.name}, {shareholder.id}</p>
    </div>
  );
}
