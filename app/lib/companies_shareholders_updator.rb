# frozen_string_literal: true

class CompaniesShareholdersUpdator < CompanyShareholdersUpdator
  def call(companies)
    time_shift = DateTime.now.utc - 40
    companies.each.with_index(1) do |company, index|
      if company.shares.empty? || company.shares[0].updated_at < time_shift
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
