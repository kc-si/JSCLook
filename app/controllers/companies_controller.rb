# frozen_string_literal: true

require 'gpw/client'

class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def patch
    GPW::Client.new.fetch_companies_list
    flash[:notice] = 'Companies list successfully updated'
    redirect_to '/companies'
  end
end
