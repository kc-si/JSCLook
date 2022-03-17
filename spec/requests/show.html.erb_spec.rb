# frozen_string_literal: true

require 'rails_helper'

<<<<<<< HEAD
RSpec.describe 'GET /companies/:id', type: :request do
  it 'displays selected company' do
    company = Company.create!(name: 'MOSTALPLC', symbol: 'PLMSTPL00018')
    id = company.id

    get "/companies/#{id}"

    expect(response).to have_http_status(:success)
    expect(response.body).to include('Company')
    expect(response.body).to include('MOSTALPLC')
=======
RSpec.describe 'Show', type: :request do
  describe 'GET /companies/:id' do
    it 'displays selected company' do
      Company.create!([
        {
          name: 'MOSTALPLC',
          symbol: 'PLMSTPL00018',
        },
        {
          name: 'MERCATOR',
          symbol: 'PLMRCTR00015',
        },
      ])
      id = Company.find_by(name: 'MOSTALPLC').id
      get "/companies/#{id}"

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Company')
      expect(response.body).to include('MOSTALPLC')
    end
>>>>>>> Add reading and display companies list from URL
  end
end
