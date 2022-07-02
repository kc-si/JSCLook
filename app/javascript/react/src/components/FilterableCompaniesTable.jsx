import React from 'react';
import ReactDOM from 'react-dom';
import SearchBar from './SearchBar';

class CompaniesTableHead extends React.Component {
  render() {
    return (
      <tr>
        <th scope="col">#</th>
        <th scope="col">Joint Stock Company</th>
        <th scope="col">Symbol/ISIN</th>
        <th scope="col">Stock</th>
        <th scope="col">Shares amount</th>
      </tr>
    )
  }
}

class CompaniesTableRow extends React.Component {
  render() {
    const company = this.props.company;
    const index = this.props.index;

    return (
      <tr>
        <td className="text-dark" >{index + 1}</td>
        <td><button className="nav-link text-dark p-0">{company.name}</button></td>
        <td className="text-muted" >{company.isin}</td>
        <td className="text-muted" >{company.stock}</td>
        <td className="text-muted" >{company.shares_amount}</td>
      </tr>
    )
  }
}

class FilterableCompaniesTable extends React.Component {
  constructor(props) {
    super(props);
    this.handleFilterChange = this.handleFilterChange.bind(this);
    this.state = {
      filter: '',
    };
  }

  handleFilterChange(value) {
    this.setState({ filter: value });
  }

  render() {
    const data = [
      {
        "id": 17, "name": "ABPL", "isin": "PLAB00000019", "created_at": "2022-04-30T07:49:31.365Z",
        "updated_at": "2022-06-23T11:07:18.155Z", "full_name": "AB SPÓŁKA AKCYJNA", "abbreviation": "ABE",
        "stock": "GPW", "sector": "komputery i elektronika ",
        "belong_to": "WIG140, sWIG80TR, WIG-Poland, InvestorMS, sWIG80, WIG, ", "price": "752,73",
        "book_value": "1 131,31 ", "shares_amount": "16 187 644", "www": "www.ab.pl ", "e_mail": "sekretariat@ab.pl ",
        "pbv": "0.64961498402969", "pe": "4.9896417372192", "condition": "company_active",
        "profile_updated_at": "2022-06-23T10:45:53.476Z", "shares_updated_at": "2022-06-23T11:07:18.153Z"
      }, {
        "id": 14, "name": "ABAK", "isin": "PLABAK000013", "created_at": "2022-04-30T07:49:31.288Z",
        "updated_at": "2022-05-05T16:51:59.145Z", "full_name": "Abak SA", "abbreviation": "ABK",
        "stock": "NC", "sector": "8,89",
        "belong_to": "", "price": null,
        "book_value": "13,20", "shares_amount": null, "www": null, "e_mail": null,
        "pbv": null, "pe": null, "condition": "company_active",
        "profile_updated_at": null, "shares_updated_at": null
      }
    ];
    const filter = this.state.filter;

    const tbody = data.map(
      (company, index) => {
        if (company.name.toLowerCase().includes(filter.toLowerCase()) || company.isin.toLowerCase().includes(filter.toLowerCase()))
          return (
            <CompaniesTableRow company={company} index={index} key={company.id} />
          );
      }
    );

    return (
      <div>
        <SearchBar placeholder='Filter...' value={filter} onValueChange={this.handleFilterChange} />
        <table className="table table-striped table-sm ">
          <thead>
            <CompaniesTableHead />
          </thead>
          <tbody>
            {tbody}
          </tbody>
        </table>
      </div>
    );
  }
}

export default FilterableCompaniesTable;
