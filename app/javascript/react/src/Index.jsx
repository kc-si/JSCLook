import React from "react";
import { createRoot } from "react-dom/client";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { NavBar } from "./components/NavBar";
import CompaniesContainer from "./components/companies/CompaniesContainer";
import CompanyContainer from "./components/company/CompanyContainer";
import ShareholdersContainer from "./components/shareholders/ShareholdersContainer";
import ShareholderContainer from "./components/shareholder/ShareholderContainer";

export const Root = () => {
  return (
    <BrowserRouter>
      <Routes>
        < Route path="/react" element={<NavBar />} >
          <Route path="companies" element={<CompaniesContainer />} />
          <Route path="companies/:id" element={<CompanyContainer />} ></Route>
          <Route path="shareholders" element={<ShareholdersContainer />} />
          <Route path="shareholders/:id" element={<ShareholderContainer />} ></Route>
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

const root = createRoot(document.getElementById("root"));
root.render(<Root />);
