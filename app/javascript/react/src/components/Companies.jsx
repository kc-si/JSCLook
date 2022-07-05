import React from 'react';
import FilterableCompaniesTable from './FilterableCompaniesTable';
import Company from './Company';

class Companies extends React.Component {
  constructor(props) {
    super(props);
    this.handleOnCompanyClick = this.handleOnCompanyClick.bind(this);
    this.handleCompanyBackClick = this.handleCompanyBackClick.bind(this);
    this.state = {
      companyId: null,
    }
  }

  handleOnCompanyClick(id) {
    this.setState({
      companyId: id,
    });
  }

  handleCompanyBackClick() {
    this.setState({
      companyId: null,
    });
  }

  render() {
    const companies = this.props.companies;
    const companyId = this.state.companyId;
    let company = null;
    if (companies && companyId) {
      company = companies.find(company => company.id === companyId);
    }
    return (
      <div>
        {company
          ? <Company company={company} onBackClick={() => this.handleCompanyBackClick()}/>
          : <FilterableCompaniesTable companies={companies} onClick={(id) => this.handleOnCompanyClick(id)} />
        }
      </div>
    );
  }
}

export default Companies;
