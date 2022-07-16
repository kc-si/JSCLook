import React from "react";
import { Body } from "./table/Body";
import { Head } from "./table/Head";

export const Table = ({ companies, shares, filter }) => {
  return (
    <div>
      <table className="table table-striped table-hover table-sm">
        <thead>
          <Head />
        </thead>
        <tbody>
          <Body companies={companies} shares={shares} filter={filter}/>
        </tbody>
      </table>
    </div>
  );
};
