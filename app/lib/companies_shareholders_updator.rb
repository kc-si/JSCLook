# frozen_string_literal: true

MIN_PERIOD_BETWEEN_SHAREHOLDERS_UPDATE = 40.days

class CompaniesShareholdersUpdator < CompanyShareholdersUpdator
  def call(companies)
    companies.each.with_index(1) do |company, index|
      if company.shares_updated_at.nil? || company.shares_updated_at < MIN_PERIOD_BETWEEN_SHAREHOLDERS_UPDATE.ago
        CompanyShareholdersUpdator.call(company.id)
        slow_iteration(index)
      end
    end
  end

  def slow_iteration(index)
    interval = (2 + (index % 3)).seconds
    sleep(interval)
  end
end
