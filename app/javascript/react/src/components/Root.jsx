import React from 'react'
import ReactDOM from 'react-dom'
import { createRoot } from 'react-dom/client'

import CompaniesTable from './CompaniesTable'

class Root extends React.Component {
  render() {
    return (
      <CompaniesTable />
    );
  }
}

const root = createRoot(document.getElementById('root'));
root.render(<Root />);

export default Root
