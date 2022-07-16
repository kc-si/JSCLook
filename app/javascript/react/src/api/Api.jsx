import React, { useState, useEffect } from "react";
import axios from "axios";

// const companies_API_Url = "https://jsclook.herokuapp.com/api/v1/companies/";
// const shareholders_API_Url = "https://jsclook.herokuapp.com/api/v1/shareholders/";
const companies_API_Url = "http://localhost:3000/api/v1/companies/";
const shareholders_API_Url = "http://localhost:3000/api/v1/shareholders/";

export const fetchCompanies = async () => {
  const response = await axios.get(companies_API_Url);
  return (response.data);
};

export const fetchCompany = async (id) => {
  const response = await axios.get(companies_API_Url + id);
  return (response.data);
};

export const fetchShareholders = async () => {
  const response = await axios.get(shareholders_API_Url);
  return (response.data);
};

export const fetchShareholder = async (id) => {
  const response = await axios.get(shareholders_API_Url + id);
  return (response.data);
};

export const fetchShareholderCompanies = async (id) => {
  const response = await axios.get(shareholders_API_Url + id + "/companies");
  return (response.data);
};

export const fetchShareholderShares = async (id) => {
  const response = await axios.get(shareholders_API_Url + id + "/shares");
  return (response.data);
};
