# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CompaniesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/companies').to route_to('api/v1/companies#index', format: 'json')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/companies/1').to route_to('api/v1/companies#show', id: '1', format: 'json')
    end
  end
end
