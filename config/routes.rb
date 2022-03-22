# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'companies#index'

  get '/companies/update_db', to: 'companies#update_db'

  resources :companies, only: [:index, :show]
end
