import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { fetchCompanies, fetchCompany } from "../../api/Api";
import SearchBar from "../SearchBar";
import { Table } from "./Table";
import { Company } from "./Company";

export default function CompanyContainer() {
  let params = useParams();
  const [companies, setCompanies] = useState([]);
  const [company, setCompany] = useState(null);
  const [filter, setFilter] = useState("");
  const [id, setId] = useState(parseInt(params.id, 10));

  useEffect(() => {
    fetchCompany(id).then((data) => {
      setCompany(data);
    });
  }, [id]);

  useEffect(() => {
    fetchCompanies().then((data) => {
      setCompanies(data);
    });
  }, []);


  const handleFilterChange = (value) => {
    setFilter(value);
  };

  const handleIdChange = (id) => {
    setId(id);
    history.replaceState(null, '', id)
  };

  if (company) {
    return (
      <div>
        <SearchBar placeholder="Filter..." value={filter} onValueChange={(value) => handleFilterChange(value)} />
        <div className="row">
          <div className="col col-4">
            <Table companies={companies} filter={filter} onCompanyNameClick={(id) => { handleIdChange(id) }} />
          </div>
          <div className="col">
            <Company company={company} />
          </div>
        </div>
      </div>
    );
  }
};
