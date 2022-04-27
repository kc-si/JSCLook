# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root 'companies#index'

  get '/companies/:id/shareholders', to: 'companies#show_company_shareholders',
    as: 'companies_show_company_shareholders'
  post '/companies/update_companies_list', to: 'companies#update_companies_list'
  post '/companies/update_companies_details', to: 'companies#update_companies_details'
  post '/companies/:id/update_shareholders', to: 'companies#update_company_shareholders',
    as: 'companies_update_company_shareholders'
  post '/companies/update_shareholders', to: 'companies#update_selected_companies_shareholders',
    as: 'companies_update_selected_companies_shareholders'
  post '/companies/:id/update_profile', to: 'companies#update_company_profile',
    as: 'companies_update_company_profile'
  post '/companies/update_profiles', to: 'companies#update_selected_companies_profiles',
    as: 'companies_update_selected_companies_profiles'

  get '/legal_reservations', to: 'static_pages#legal_reservations'

  resources :companies, only: [:index, :show]
  resources :shareholders, only: [:index]
end
