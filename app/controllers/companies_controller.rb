# frozen_string_literal: true

require 'gpw/client'

class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def update_companies_list
    companies = GPW::Client.new.fetch_companies_list
    companies.each { |company| Company.find_or_create_by!(company) }
    flash[:notice] = 'Companies list successfully updated'
    redirect_to companies_url
  end
end
