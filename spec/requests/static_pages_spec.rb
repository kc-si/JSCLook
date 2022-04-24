# frozen_string_literal: true

RSpec.describe 'GET /legal_reservations', type: :request do
  it 'renders legal reservations' do
    get legal_reservations_path

    expect(response).to have_http_status(:success)
    expect(response.body).to include('complete and truthful')
  end
end
