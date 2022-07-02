import React from 'react'
import ReactDOM from 'react-dom'
import { createRoot } from 'react-dom/client'

import FilterableCompaniesTable from './FilterableCompaniesTable'

class Root extends React.Component {
  render() {
    return (
      <FilterableCompaniesTable />
    );
  }
}

const root = createRoot(document.getElementById('root'));
root.render(<Root />);

export default Root
