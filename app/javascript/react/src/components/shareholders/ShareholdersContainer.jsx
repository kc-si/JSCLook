import React, { useEffect, useState } from "react";
import { fetchShareholders } from "../../api/Api"
import { Table } from "./Table";
import SearchBar from "../SearchBar";

export default function ShareholdersContainer() {
  const [shareholders, setShareholders] = useState([]);
  const [filter, setFilter] = useState("");

  useEffect(() => {
    fetchShareholders().then((data) => {
      setShareholders(data);
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
        <Table shareholders={shareholders} filter={filter} />
      </div>
    </div>
  );
}
