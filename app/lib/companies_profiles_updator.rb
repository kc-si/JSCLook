# frozen_string_literal: true

MIN_PERIOD_BETWEEN_PROFILE_UPDATE = 40.days

class CompaniesProfilesUpdator < CompanyProfileUpdator
  def call(companies)
    companies.each.with_index(1) do |company, index|
      if company.profile_updated_at.nil? || company.profile_updated_at < MIN_PERIOD_BETWEEN_PROFILE_UPDATE.ago
        CompanyProfileUpdator.call(company.id)
        slow_iteration(index)
      end
    end
  end

  def slow_iteration(index)
    interval = (2 + (index % 3)).seconds
    sleep(interval)
  end
end
