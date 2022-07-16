import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { /*fetchShareholders,*/ fetchShareholder } from "../../api/Api";
// import SearchBar from "../SearchBar";
// import { Table } from "../shareholders/Table";
import { Shareholder } from "./Shareholder";

export default function ShareholderContainer() {
  let params = useParams();
  // const [shareholders, setShareholders] = useState([]);
  const [shareholder, setShareholder] = useState(null);
  // const [filter, setFilter] = useState("");
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

  // const handleFilterChange = (value) => {
  //   setFilter(value);
  // };

  // const handleIdChange = (id) => {
  //   setId(id);
  //   history.replaceState(null, '', id)
  // };

  if (shareholder) {
    return (
      <div>
        {/* <SearchBar placeholder="Filter..." value={filter} onValueChange={(value) => handleFilterChange(value)} /> */}
        <div className="row">
          {/* <div className="col col-4">
            <Table shareholders={shareholders} filter={filter} onshareholderNameClick={(id) => { handleIdChange(id) }} />
          </div> */}
          <div className="col">
            <Shareholder shareholder={shareholder} />
          </div>
        </div>
      </div>
    );
  }
};
