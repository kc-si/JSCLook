import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import {
  fetchShareholder,
  fetchShareholderCompanies,
  fetchShareholderShares,
} from "../../api/Api";
import SearchBar from "../SearchBar";
import { Table } from "./Table";
import { Shareholder } from "./Shareholder";

export default function ShareholderContainer() {
  let params = useParams();
  const id = parseInt(params.id, 10);
  const [shareholder, setShareholder] = useState(null);
  const [shareholderCompanies, setShareholderCompanies] = useState([]);
  const [shareholderShares, setShareholderShares] = useState([]);
  const [filter, setFilter] = useState("");
  let filteredShareholderCompanies = [];

  useEffect(() => {
    fetchShareholder(id).then((data) => {
      setShareholder(data);
    });
  }, [id]);

  useEffect(() => {
    fetchShareholderCompanies(id).then((data) => {
      setShareholderCompanies(data);
    });
  }, [id]);

  useEffect(() => {
    fetchShareholderShares(id).then((data) => {
      setShareholderShares(data);
    });
  }, [id]);

  const handleFilterChange = (value) => {
    setFilter(value);
  };

  if (shareholderCompanies && filter != "") {
    shareholderCompanies.forEach((company) => {
      if (company.name.toLowerCase().includes(filter.toLowerCase()) || company.isin.toLowerCase().includes(filter.toLowerCase())) {
        filteredShareholderCompanies.push(company);
      }
    });
  } else filteredShareholderCompanies = shareholderCompanies;

  if (filteredShareholderCompanies && shareholderShares) {
    filteredShareholderCompanies.forEach((company) => {
      shareholderShares.forEach((share) => {
        if (share.company_id == company.id) {
          company.shares_amount = share.shares_count;
        };
      });
    });
  };

  if (shareholder) {
    return (
      <div>
        <hr className="mt-2" />
        <div>
          <Shareholder shareholder={shareholder} />
        </div>
        <SearchBar placeholder="Filter..." value={filter} onValueChange={(value) => handleFilterChange(value)} />
        <div className="row">
          <div className="m-2" >
            <Table companies={filteredShareholderCompanies} />
          </div>
        </div>
      </div>
    );
  }
};
