import React from "react";
import { useParams } from "react-router-dom";

export default function SearchBar({ placeholder, value, onValueChange }) {
  let params = useParams();

  const handleChange = (event) => {
    onValueChange(event.target.value);
  }

  return (
    <form>
      <input type="text" placeholder={placeholder} value={value} onChange={handleChange}>
      </input>
    </form>
  );

}
