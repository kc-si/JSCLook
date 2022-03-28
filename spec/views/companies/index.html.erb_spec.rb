# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'companies/index.html.erb', type: :view do
  context 'with 2 companies' do
    let(:companies) do
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
    end

    it 'displays a list of companies' do
      render 'companies', companies: companies

      expect(rendered).to match(/MERCATOR/)
      expect(rendered).to include('MOSTALPLC')

      expect(rendered).to match(/PLMRCTR00015/)
      expect(rendered).to include('PLMSTPL00018')
    end
  end
end
