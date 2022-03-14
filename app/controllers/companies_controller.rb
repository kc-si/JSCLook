# frozen_string_literal: true

require 'gpw/client'

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
    flash[:notice] = 'Companies list successfully updated'
    redirect_to companies_url
  end

  def update_companies_details
    CompaniesDetailsUpdator.call
    flash[:notice] = 'Companies details successfully updated'
    redirect_to companies_url
  end
end
