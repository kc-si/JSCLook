# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    validate_params
    @companies = CompaniesSelector.call(params.permit(:query, :stock, :condition))
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

  def validate_params
    validator = Companies::IndexParamsValidator.new(params.permit(:query, :stock, :condition))

    return if validator.valid?

    flash[:error] = 'Unknown search params.'
    redirect_to companies_url
  end
end
