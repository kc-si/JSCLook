# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Companies', type: :request do
  describe 'GET /companies' do
    it 'render the list of companies' do
      Company.create!([
        {
          name: 'MERCATOR',
          symbol: 'PLMRCTR00015',
        },
        {
          name: 'MOSTALPLC',
          symbol: 'PLMSTPL00018',
        },
      ])

      get '/companies'

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Symbol')
      expect(response.body).to include('MERCATOR')
      expect(response.body).to include('MOSTALPLC')
    end
  end
end

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

RSpec.describe 'GET /companies/patch', type: :request do
  it 'fetch and update the list of companies' do
    get '/companies/patch'

    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to('/companies')
    expect(flash[:notice]).to eq('Companies list successfully updated')
  end
end
