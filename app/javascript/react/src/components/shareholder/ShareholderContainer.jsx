import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import {
  fetchShareholders,
  fetchShareholder,
  fetchShareholderCompanies,
  fetchShareholderShares,
} from "../../api/Api";
import SearchBar from "../SearchBar";
import { Table } from "./Table";
import { Shareholder } from "./Shareholder";

export default function ShareholderContainer() {
  let params = useParams();
  // const [shareholders, setShareholders] = useState([]);
  const [shareholder, setShareholder] = useState(null);
  const [shareholderCompanies, setShareholderCompanies] = useState([]);
  const [shareholderShares, setShareholderShares] = useState([]);
  const [filter, setFilter] = useState("");
  const [id, setId] = useState(parseInt(params.id, 10));

  // useEffect(() => {
  //   fetchShareholders().then((data) => {
  //     setShareholders(data);
  //   });
  // }, []);

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

  // const handleIdChange = (id) => {
  //   setId(id);
  //   history.replaceState(null, '', id)
  // };

  if (shareholder) {
    return (
      <div>
        <hr className="mt-2" />
        <h4>{shareholder.name}</h4>
        <SearchBar placeholder="Filter..." value={filter} onValueChange={(value) => handleFilterChange(value)} />
        <div className="row">
        <div className="m-2" >
        <Table companies={shareholderCompanies} shares={shareholderShares} filter={filter} />
      </div>
          {/* <div className="col col-4">
            <Table shareholders={shareholders} filter={filter} onshareholderNameClick={(id) => { handleIdChange(id) }} />
          </div> */}
          <div className="col">
            <Shareholder shareholder={shareholder} companies={shareholderCompanies} shares={shareholderShares} />
          </div>
        </div>
      </div>
    );
  }
};
