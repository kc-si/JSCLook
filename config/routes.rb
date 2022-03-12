# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'companies#index'

  get '/companies', to: 'companies#index'
end
