# frozen_string_literal: true

class CompanyProfileUpdator < ApplicationService
  def initialize
    @gpw_client = GPW::Client.new
  end

  def call(id)
    company = Company.find(id)
    company_attrs = @gpw_client.fetch_gpw_company_profile(company.stock, company.isin)
    update_company_profile(company_attrs, company)
  end

  private

  def update_company_profile(company_attrs, company)
    company_attrs.merge!({ profile_updated_at: DateTime.now.utc })
    company.update!(company_attrs)
  end
end
