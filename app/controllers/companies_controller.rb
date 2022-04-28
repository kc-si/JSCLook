# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    if index_params_valid?
      @companies = CompaniesSelector.call(params.permit(:query, :stock, :condition))
      render 'index'
    else
      render file: Rails.root.join('public/400.html'), layout: false
    end
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

  private

  def index_params_valid?
    Companies::IndexParamsValidator.new(params.permit(:query, :stock, :condition)).valid?
  end
end
