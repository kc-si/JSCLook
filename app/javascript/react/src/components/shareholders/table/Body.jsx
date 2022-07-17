import React from "react";
import { Row } from "./Row";

export const Body = ({ shareholders }) => {
  if (shareholders) {
    return shareholders.map(
      (shareholder, index) => {
        return (
          <Row
            shareholder={shareholder}
            index={index}
            key={shareholder.id}
          />
        );
      }
    );
  } else return null;
};
