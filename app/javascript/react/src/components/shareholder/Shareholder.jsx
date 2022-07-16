import React from "react";

export const Shareholder = ({ shareholder }) => {
  return (
    <div>
      <div className="h4 d-inline fw-light">Shareholder: </div>
      <div className="h4 d-inline ms-4" >{shareholder.name}</div>
      <hr className="mt-2" />
      <h5 className="text-muted fw-light">List of shareholder companies:</h5>
    </div>
  );
}
