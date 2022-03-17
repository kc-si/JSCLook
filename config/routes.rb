# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'companies#index'

<<<<<<< HEAD
  resources :companies, only: [:index, :show]
=======
  get '/companies/update_db', to: 'companies#update_db'

  resources :companies, only: [:index, :show, :new]
>>>>>>> Add reading and display companies list from URL
end
