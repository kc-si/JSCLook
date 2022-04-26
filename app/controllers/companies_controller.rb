# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    if selector_params_valid?
      @companies = CompaniesSelector.call(params.permit(:query, :stock, :condition))
      render 'index'
    else
      render file: Rails.root.join('public/400.html'), layout: false
    end
  end

  def show
    company = Company.find(params.require(:id))
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

  def update_selected_companies_shareholders
    if params[:id]
      update_company_shareholders(params[:id])
    elsif selector_params_valid?
      companies = CompaniesSelector.call(params.permit(:query, :stock, :condition))
      CompaniesShareholdersUpdator.call(companies)
      redirect_to companies_url(params[:stock]), notice: t('companies.update_selected_companies_shareholders.success')
    else
      render_bad_request_error
    end
  end

  private

  def selector_params_valid?
    Companies::SelectorParamsValidator.new(params.permit(:query, :stock, :condition)).valid?
  end

  def render_bad_request_error
    render file: Rails.root.join('public/400.html'), layout: false
  end

  def update_company_shareholders(id)
    CompanyShareholdersUpdator.call(id)
    redirect_to company_url(id), notice: t('companies.update_company_shareholders.success')
  end
end
