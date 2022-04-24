# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompaniesSelector do
  context 'with param :query' do
    it 'selects companies accroding to the params' do
      Company.create!([
        {
          name: 'MERCATOR',
          isin: 'PLMRCTR00015',
          stock: 'GPW',
          condition: 'company_active',
        },
        {
          name: 'MOSTALPLC',
          isin: 'PLMSTPL00018',
          stock: 'NC',
          condition: 'company_active',
        },
      ])

      params = { query: 'MOS' }
      companies = CompaniesSelector.call(params)

      expect(companies).to contain_exactly(
        have_attributes(
          name: 'MOSTALPLC',
          isin: 'PLMSTPL00018',
          stock: 'NC',
          condition: 'company_active',
        ),
      )
    end
  end

  context 'with params :query and :condition' do
    it 'selects companies accroding to the params' do
      Company.create!([
        {
          name: 'MERCATOR',
          isin: 'PLMRCTR00015',
          stock: 'GPW',
          condition: 'company_active',
        },
        {
          name: 'MOSTALPLC',
          isin: 'PLMSTPL00018',
          stock: 'NC',
          condition: 'company_active',
        },
      ])

      params = { query: 'MOS', condition: 'company_active' }
      companies = CompaniesSelector.call(params)

      expect(companies).to contain_exactly(
        have_attributes(
          name: 'MOSTALPLC',
          isin: 'PLMSTPL00018',
          stock: 'NC',
          condition: 'company_active',
        ),
      )
    end
  end

  context 'with param :stock' do
    it 'selects companies accroding to the params' do
      Company.create!([
        {
          name: 'MERCATOR',
          isin: 'PLMRCTR00015',
          stock: 'GPW',
          condition: 'company_active',
        },
        {
          name: 'MOSTALPLC',
          isin: 'PLMSTPL00018',
          stock: 'NC',
          condition: 'company_active',
        },
      ])

      params = { stock: 'GPW' }
      companies = CompaniesSelector.call(params)

      expect(companies).to contain_exactly(
        have_attributes(
          name: 'MERCATOR',
          isin: 'PLMRCTR00015',
          stock: 'GPW',
          condition: 'company_active',
        ),
      )
    end
  end

  context 'with param :query set for a nonexistent company' do
    it 'should not return companies' do
      Company.create!([
        {
          name: 'MERCATOR',
          isin: 'PLMRCTR00015',
          stock: 'GPW',
          condition: 'company_active',
        },
        {
          name: 'MOSTALPLC',
          isin: 'PLMSTPL00018',
          stock: 'NC',
          condition: 'company_active',
        },
      ])

      params = { query: 'ALI' }
      companies = CompaniesSelector.call(params)

      expect(companies).not_to contain_exactly(
        have_attributes(
          name: 'MOSTALPLC',
          isin: 'PLMSTPL00018',
          stock: 'GPW',
          condition: 'company_active',
        ),
      )
    end
  end
end
