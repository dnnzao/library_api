#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/routes.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


Rails.application.routes.draw do
  # Devise Token Auth routes
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'registrations'
  }

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Confirmation success route
  get 'verify_email', to: 'users#verify_email'
  get 'confirmation_success', to: 'users#confirmation_success', as: :confirmation_success

  # Resources routes
  resources :books
  resources :publishers
  resources :categories
  resources :users, only: [:index, :show, :create, :update, :destroy]


  # API routes
  namespace :api do
    namespace :v1 do
      post 'send_test_email' => 'email#send_test_email'
    end
  end
end
