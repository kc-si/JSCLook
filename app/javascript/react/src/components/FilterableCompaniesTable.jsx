import React from 'react';
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
    );
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
    );
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

  createTableBody(companies, filter) {
    if (companies) {
      return companies.map(
        (company, index) => {
          if (company.name.toLowerCase().includes(filter.toLowerCase()) || company.isin.toLowerCase().includes(filter.toLowerCase()))
            return (
              <CompaniesTableRow company={company} index={index} key={company.id} />
            );
        }
      );
    } else return null;
  }

  render() {
    const companies = this.props.companies ? this.props.companies : [];
    const filter = this.state.filter;
    const tbody = this.createTableBody(companies, filter);

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
