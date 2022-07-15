import React, { useEffect, useState } from "react";
import { fetchCompanies } from "../../api/Api"
import { Table } from "./Table";
import SearchBar from "../SearchBar";

export default function CompaniesContainer() {

  const [companies, setCompanies] = useState([]);
  const [filter, setFilter] = useState("");

  useEffect(() => {
    fetchCompanies().then((data) => {
      setCompanies(data);
    });
  }, []);

  const handleFilterChange = (value) => {
    setFilter(value);
  };

  return (
    <div>
      <div>
        <SearchBar placeholder="Filter..." value={filter} onValueChange={(value) => { handleFilterChange(value) }} />
      </div>
      <div className="m-2" >
        <Table companies={companies} filter={filter} />
      </div>
    </div>
  );
}
