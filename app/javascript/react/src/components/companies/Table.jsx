import React from "react";
import { Body } from "./table/Body";
import { Head } from "./table/Head";

export const Table = ({ companies, filter }) => {
  return (
    <div>
      <table className="table table-striped table-sm ">
        <thead>
          <Head />
        </thead>
        <tbody>
          <Body companies={companies} filter={filter}/>
        </tbody>
      </table>
    </div>
  );
};
