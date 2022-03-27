# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Companies', type: :request do
  describe 'GET /companies' do
    it 'render the list of companies' do
      Company.create!([
        {
          name: 'MERCATOR',
          isin: 'PLMRCTR00015',
        },
        {
          name: 'MOSTALPLC',
          isin: 'PLMSTPL00018',
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
    company = Company.create!(name: 'MOSTALPLC', isin: 'PLMSTPL00018')
    id = company.id

    get "/companies/#{id}"

    expect(response).to have_http_status(:success)
    expect(response.body).to include('Company')
    expect(response.body).to include('MOSTALPLC')
  end
end

RSpec.describe 'GET /companies/update_companies_list', type: :request do
  it 'fetch and update the list of companies' do
    stub_request(:get, 'https://gpw.notoria.pl/widgets/ta/symbols.php')
      .with(
        headers: {
          'Accept' => 'application/json',
          'X-Requested-With' => 'XMLHttpRequest',
          'Referer' => 'https://gpw.notoria.pl',
          'DNT' => '1',
          'Sec-GPC' => '1',
        },
      )
      .to_return(
        status: 200,
        body: '({"status":"OK","symbols":[["PKNORLEN","PLPKN0000018"],["PKOBP","PLPKO0000016"]]})"',
        headers: {},
      )

    get '/companies/update_companies_list'

    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to('/companies')
    expect(flash[:notice]).to eq('Companies list successfully updated')
  end
end
