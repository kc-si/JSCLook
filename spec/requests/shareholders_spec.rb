# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shareholders', type: :request do
  describe 'GET /shareholders' do
    it 'returns http success' do
      get '/shareholders'
      expect(response).to have_http_status(:success)
    end
  end
end
