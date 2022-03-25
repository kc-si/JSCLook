# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'companies#index'

  get '/companies/patch', to: 'companies#patch'

  resources :companies, only: [:index, :show]
end
