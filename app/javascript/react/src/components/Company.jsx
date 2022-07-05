import React from 'react';

class Company extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const company = this.props.company;
    return (
      <div className="container">
        <div className="container">
          <h4>{company.name}</h4>
          <p className='small text-muted'>{company.belong_to}</p>
        </div>
        <hr />
        <div className="col m-2">
          <div className="row">
            <table>
              <tbody>
                <tr>
                  <td>P/BV</td>
                  <td>{company.pbv ? company.pbv.match(/.*[.,]\d{0,3}/) : null}</td>
                </tr>
                <tr>
                  <td>P/E</td>
                  <td>{company.pe ? company.pe.match(/.*[.,]\d{0,3}/) : null}</td>
                </tr>
                <tr>
                  <td>Capitalization</td>
                  <td>{company.price ? company.price.match(/.*[.,]\d{0,3}/) + ' million' : null}</td>
                </tr>
                <tr>
                  <td>Book value (PLN)</td>
                  <td>{company.book_value ? company.book_value + ' million' : null}</td>
                </tr>
                <tr>
                  <td>Shares amount</td>
                  <td>{company.shares_amount}</td>
                </tr>
                <tr>
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
        <div>
          <button className="btn btn-outline-secondary btn-sm" onClick={this.props.onBackClick}>Back</button>
        </div>
      </div>
    );
  }
}

export default Company;
