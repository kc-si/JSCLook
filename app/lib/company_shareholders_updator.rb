# frozen_string_literal: true

class CompanyShareholdersUpdator < ApplicationService
  def initialize
    @gpw_client = GPW::Client.new
  end

  def call(id)
    company = Company.find(id)
    company_shareholders = @gpw_client.fetch_company_shareholders(company.stock, company.isin)
    upsert_company_shareholders(company_shareholders, company)
    company.update!(shares_updated_at: DateTime.now.utc)
  end

  private

  def upsert_company_shareholders(company_shareholders, company)
    company_shareholders.each do |shareholder_attrs|
      shareholder = Shareholder.find_or_create_by!(name: shareholder_attrs.fetch(:name))
      shares_count = shareholder_attrs.fetch(:shares_count)
      upsert_shares_count(company, shareholder, shares_count)
    end
  end

  def upsert_shares_count(company, shareholder, shares_count)
    share = company.shares.find_by(shareholder_id: shareholder.id)

    if share
      share.update!(shares_count: shares_count, updated_at: Time.now.utc)
    else
      Share.create!(shareholder_id: shareholder.id, company_id: company.id, shares_count: shares_count)
    end
  end
end
