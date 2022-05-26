# frozen_string_literal: true

RSpec.describe 'Companies', type: :request do
  describe 'GET /companies' do
    it 'render the list of companies' do
      Company.create!([
        {
          name: 'MERCATOR',
          isin: 'PLMRCTR00015',
          condition: 'company_active',
        },
        {
          name: 'MOSTALPLC',
          isin: 'PLMSTPL00018',
          condition: 'company_active',
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
    company = Company.create!(name: 'MOSTALPLC', isin: 'PLMSTPL00018', condition: 'company_active')
    id = company.id

    get "/companies/#{id}"

    expect(response).to have_http_status(:success)
    expect(response.body).to include('Stock')
    expect(response.body).to include('MOSTALPLC')
  end
end

RSpec.describe 'POST /companies/update_companies_list', type: :request do
  it 'fetch and update the list of companies' do
    stub_request(:get, 'https://gpw.notoria.pl/widgets/ta/symbols.php')
      .with(
        headers: {
          'Accept' => 'application/json',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Referer' => 'https://gpw.notoria.pl',
          'User-Agent' => 'Faraday v2.3.0',
        },
      )
      .to_return(
        status: 200,
        body: '({"status":"OK","symbols":[["PKNORLEN","PLPKN0000018"],["PKOBP","PLPKO0000016"]]})',
        headers: {},
      )

    post '/companies/update_companies_list'

    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to('/companies')
    expect(flash[:notice]).to eq('Companies list successfully updated')
  end
end

RSpec.describe 'GET /companies/?query=MST&commit=Search', type: :request do
  it 'displays companies where param query is include in name or isin' do
    Company.create!([
      {
        name: 'MERCATOR',
        isin: 'PLMRCTR00015',
        condition: 'company_active',
      },
      {
        name: 'MOSTALPLC',
        isin: 'PLMSTPL00018',
        condition: 'company_active',
      },
    ])

    get '/companies/?query=MST&commit=Search'

    expect(response).to have_http_status(:success)
    expect(response.body).to include('Search result')
    expect(response.body).to include('MOSTALPLC')
    expect(response.body).to_not include('MERCATOR')
  end
end
