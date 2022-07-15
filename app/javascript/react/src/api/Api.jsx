import React, { useState, useEffect } from "react";
import axios from "axios";

const companies_API_Url = "https://jsclook.herokuapp.com/api/v1/companies/";

export const fetchCompanies = async () => {
  const response = await axios.get(companies_API_Url);
  return (response.data);
};

export const fetchCompany = async (id) => {
  const response = await axios.get(companies_API_Url + id);
  return (response.data);
};
