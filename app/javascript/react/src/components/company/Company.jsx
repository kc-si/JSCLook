import React from "react";

export const Company = ({ company }) => {
  return (
    <div>
      <div className="container">
        <h3>{company.name}</h3>
        <p className="small text-muted">{company.belong_to}</p>
      </div>
      <hr />
      <div className="col m-2">
        <div className="row">
          <table>
            <tbody>
              <tr>
                <td className="pb-4"><h6>Company ISIN</h6></td>
                <td className="pb-4"><h6>{company.isin}</h6></td>
              </tr>
              <tr>
                <td>P/BV</td>
                <td className="text-danger fw-light">{company.pbv ? company.pbv.match(/.*[.,]\d{0,2}/) : null}</td>
              </tr>
              <tr>
                <td className="pb-2">P/E</td>
                <td className="text-danger fw-light pb-2">{company.pe ? company.pe.match(/.*[.,]\d{0,2}/) : null}</td>
              </tr>
              <tr>
                <td className="fw-light">Capitalization</td>
                <td className="fw-light">{company.price ? company.price.match(/.*[.,]\d{0,3}/) + " million" : null}</td>
              </tr>
              <tr>
                <td className="fw-light">Book value (PLN)</td>
                <td className="fw-light">{company.book_value ? company.book_value + " million" : null}</td>
              </tr>
              <tr>
                <td className="fw-light pb-4">Shares amount</td>
                <td className="fw-light pb-4">{company.shares_amount}</td>
              </tr>
              <tr className="border-top">
                <td>Stock</td>
                <td>{company.stock}</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div className="row">
          <table>
            <tbody>
              <tr>
                <td>Full name</td>
                <td>{company.full_name}</td>
              </tr>
              <tr>
                <td>Sector</td>
                <td>{company.sector}</td>
              </tr>
              <tr>
                <td>www</td>
                <td>{company.www}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
