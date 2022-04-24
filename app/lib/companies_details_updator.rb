# frozen_string_literal: true

class CompaniesDetailsUpdator < ApplicationService
  def initialize
    @gpw_client = Gpw::Client.new
  end

  def call
    companies_attrs = fetch_companies_details
    update_companies_details(companies_attrs)
  end

  private

  def fetch_companies_details
    @gpw_client.fetch_gpw_companies_details + @gpw_client.fetch_nc_companies_details
  end

  def update_companies_details(companies_attrs)
    companies_attrs.each do |company_attrs|
      Company.find_by(isin: company_attrs.fetch(:isin))&.update!(company_attrs)
    end
  end
end
