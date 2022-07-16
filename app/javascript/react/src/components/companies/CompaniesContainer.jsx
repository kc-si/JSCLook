import React, { useEffect, useState } from "react";
import { fetchCompanies } from "../../api/Api"
import { Table } from "./Table";
import SearchBar from "../SearchBar";

export default function CompaniesContainer() {

  const [companies, setCompanies] = useState([]);
  const [filter, setFilter] = useState("");
  let filteredCompanies = [];

  useEffect(() => {
    fetchCompanies().then((data) => {
      setCompanies(data);
    });
  }, []);

  const handleFilterChange = (value) => {
    setFilter(value);
  };

  if (companies && filter != "") {
    companies.forEach((company) => {
      if (company.name.toLowerCase().includes(filter.toLowerCase()) || company.isin.toLowerCase().includes(filter.toLowerCase())) {
        filteredCompanies.push(company);
      }
    });
  } else filteredCompanies = companies;

  return (
    <div>
      <div>
        <SearchBar placeholder="Filter..." value={filter} onValueChange={(value) => { handleFilterChange(value) }} />
      </div>
      <div className="m-2" >
        <Table companies={filteredCompanies} />
      </div>
    </div>
  );
}
