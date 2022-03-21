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
