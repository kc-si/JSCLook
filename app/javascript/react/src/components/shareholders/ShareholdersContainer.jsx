import React, { useEffect, useState } from "react";
import { fetchShareholders } from "../../api/Api"
import { Table } from "./Table";
import SearchBar from "../SearchBar";

export default function ShareholdersContainer() {
  const [shareholders, setShareholders] = useState([]);
  const [filter, setFilter] = useState("");
  let filteredShareholders = [];

  useEffect(() => {
    fetchShareholders().then((data) => {
      setShareholders(data);
    });
  }, []);

  const handleFilterChange = (value) => {
    setFilter(value);
  };

  if (shareholders && filter != "") {
    shareholders.forEach((shareholder) => {
      if (shareholder.name.toLowerCase().includes(filter.toLowerCase())) {
        filteredShareholders.push(shareholder);
      }
    });
  } else filteredShareholders = shareholders;

  return (
    <div>
      <div>
        <SearchBar placeholder="Filter..." value={filter} onValueChange={(value) => { handleFilterChange(value) }} />
      </div>
      <div className="m-2" >
        <Table shareholders={filteredShareholders} />
      </div>
    </div>
  );
}
