# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ShareholdersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/shareholders').to route_to('api/v1/shareholders#index', format: 'json')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/shareholders/1').to route_to('api/v1/shareholders#show', id: '1', format: 'json')
    end
  end
end
