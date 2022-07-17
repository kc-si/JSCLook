import React from "react";
import { Body } from "./table/Body";
import { Head } from "./table/Head";

export const Table = ({ companies }) => {
  return (
    <div>
      <table className="table table-hover table-sm">
        <thead>
          <Head />
        </thead>
        <tbody>
          <Body companies={companies} />
        </tbody>
      </table>
    </div>
  );
};
