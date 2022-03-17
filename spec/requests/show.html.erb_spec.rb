# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /companies/:id', type: :request do
  it 'displays selected company' do
    company = Company.create!(name: 'MOSTALPLC', symbol: 'PLMSTPL00018')
    id = company.id

    get "/companies/#{id}"

    expect(response).to have_http_status(:success)
    expect(response.body).to include('Company')
    expect(response.body).to include('MOSTALPLC')
  end
end