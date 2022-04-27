# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    @companies = Company.all
      .select { |company| company.condition == 'company active' }
      .map { |company| CompanyPresenter.new(company) }
  end

  def show
    company = Company.find(params[:id])
    @company = CompanyPresenter.new(company)
  end

  def update_companies_list
    CompaniesListUpdator.call
    redirect_to companies_url, notice: t('companies.update_companies_list.success')
  end

  def update_companies_details
    CompaniesDetailsUpdator.call
    redirect_to companies_url, notice: t('companies.update_companies_details.success')
  end
end
