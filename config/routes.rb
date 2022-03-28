# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'companies#index'

  get '/companies/update_companies_list', to: 'companies#update_companies_list'

  resources :companies, only: [:index, :show]
end
