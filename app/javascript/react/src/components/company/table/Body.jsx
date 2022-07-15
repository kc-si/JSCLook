import React from "react";
import { Row } from "../table/Row";

export const Body = ({ companies, filter, onCompanyNameClick }) => {
  if (companies) {
    return companies.map(
      (company, index) => {
        if (company.name.toLowerCase().includes(filter.toLowerCase())
          || company.isin.toLowerCase().includes(filter.toLowerCase())) {
          return (
            <Row
              company={company}
              index={index}
              key={company.id}
              onNameClick={onCompanyNameClick}
            />
          );
        }
      }
    );
  } else return null;
};
