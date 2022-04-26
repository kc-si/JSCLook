# frozen_string_literal: true

class CompaniesListUpdator < ApplicationService
  def initialize
    @gpw_client = GPW::Client.new
  end

  def call
    companies_attrs = @gpw_client.fetch_companies_list
    companies_attrs.each { |company_attrs| upsert_company(company_attrs) }
  end

  private

  def upsert_company(attrs)
    company = Company.find_by(isin: attrs.fetch(:isin))

    if company
      company.update!(name: attrs.fetch(:name))
    else
      Company.create!(attrs)
    end
  end
end
