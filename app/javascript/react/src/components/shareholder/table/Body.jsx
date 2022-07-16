import React from "react";
import { Row } from "./Row";

export const Body = ({ companies, shares, filter }) => {
  let shareholderSharesCount = 0;
  if (companies && shares) {
    return companies.map(
      (company, index) => {
        if (company.name.toLowerCase().includes(filter.toLowerCase()) || company.isin.toLowerCase().includes(filter.toLowerCase())) {
          shares.forEach((share) => {
            if (share.company_id == company.id) {
              shareholderSharesCount = share.shares_count;
            }
          });

          return (
            <Row
              company={company}
              shares_count={shareholderSharesCount}
              index={index}
              key={company.id}
            />
          );
        }
      }
    );
  } else return null;
};
