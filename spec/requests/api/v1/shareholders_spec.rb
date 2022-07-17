# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

describe 'GET /index' do
  it 'renders a successful response' do
    Shareholder.create!([
      {
        name: 'January Szelagowski',
      },
      {
        name: 'George Brown',
      },
    ])
    get api_v1_shareholders_url, as: :json

    expect(response).to be_successful
    expect(response.body).to include('January')
    expect(response.body).to include('Brown')
    expect(response.body).to_not include('John Doe')
  end
end

describe 'GET /show' do
  it 'renders a successful response' do
    shareholder = Shareholder.create!(name: 'January Szelagowski')
    id = shareholder.id

    get api_v1_shareholder_url(id), as: :json
    expect(response).to be_successful
    expect(response.body).to include('Szelagowski')
    expect(response.body).to_not include('John Doe')
  end
end