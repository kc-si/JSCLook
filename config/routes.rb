# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root 'companies#index'

  get '/companies/update_companies_list', to: 'companies#update_companies_list'
  get '/companies/update_companies_details', to: 'companies#update_companies_details'
  get '/legal_reservations', to: 'static_pages#legal_reservations'

  resources :companies, only: [:index, :show]
end
