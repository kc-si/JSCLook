import React from "react";
import { Row } from "../table/Row";

export const Body = ({ companies, onCompanyNameClick }) => {
  if (companies) {
    return companies.map(
      (company, index) => {
        return (
          <Row
            company={company}
            index={index}
            key={company.id}
            onNameClick={onCompanyNameClick}
          />
        );
      }
    );
  } else return null;
};
