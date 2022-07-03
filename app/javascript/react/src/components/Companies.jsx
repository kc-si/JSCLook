import React from 'react';
import FilterableCompaniesTable from './FilterableCompaniesTable';

class Companies extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const companies = this.props.companies;

    return (
      <FilterableCompaniesTable companies={companies} />
    );
  }
}

export default Companies;
