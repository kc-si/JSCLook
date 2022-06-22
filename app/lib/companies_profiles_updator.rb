# frozen_string_literal: true

class CompaniesProfilesUpdator < CompanyProfileUpdator
  def call(companies)
    time_shift = DateTime.now - 1
    companies.each.with_index(1) do |company, index|
      if company.updated_at < time_shift
        CompanyProfileUpdator.call(company.id)
        slow_iteration(index)
      end
    end
  end

  def slow_iteration(index)
    sleep(4.seconds)
    sleep(20.seconds) if index % 6 == 0
    sleep(2.minutes) if index % 12 == 0
    sleep(4.minutes) if index % 40 == 0
  end
end
