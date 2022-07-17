import React from "react";
import { Row } from "./Row";

export const Body = ({ companies }) => {
  if (companies) {
    return companies.map(
      (company, index) => {
        return (
          <Row
            company={company}
            shares_count={company.shares_amount}
            index={index}
            key={company.id}
          />
        );
      }
    );
  } else return null;
};
