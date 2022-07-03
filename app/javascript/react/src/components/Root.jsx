import React from 'react';
import { createRoot } from 'react-dom/client';
import Companies from './Companies';
import GetApiData from './GetApiData';

const default_API_Url = "http://localhost:3000/api/v1/";

function Root() {
  const companies = GetApiData(default_API_Url + 'companies');

  return (
    <Companies companies={companies} />
  );
}

const root = createRoot(document.getElementById('root'));
root.render(<Root />);

export default Root;
