import React from 'react';
import axios from 'axios';

function GetApiData(URL) {
  const [data, setData] = React.useState();

  React.useEffect(() => {
    axios.get(URL).then((response) => {
      setData(response.data);
    });
  }, []);
  return (data);
}

export default GetApiData;
