import React from "react";
import { Row } from "./Row";

export const Body = ({ shareholders, filter }) => {
  if (shareholders) {
    return shareholders.map(
      (shareholder, index) => {
        if (shareholder.name.toLowerCase().includes(filter.toLowerCase())) {
          return (
            <Row
              shareholder={shareholder}
              index={index}
              key={shareholder.id}
            />
          );
        }
      }
    );
  } else return null;
};
