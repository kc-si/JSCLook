import React from "react";
import { Body } from "./table/Body";
import { Head } from "./table/Head";

export const Table = ({ shareholders }) => {
  return (
    <div>
      <table className="table table-striped table-sm ">
        <thead>
          <Head />
        </thead>
        <tbody>
          <Body shareholders={shareholders} />
        </tbody>
      </table>
    </div>
  );
};
