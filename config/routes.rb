# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/routes.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

Rails.application.routes.draw do
  # Devise Token Auth routes
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'registrations',
    confirmations: 'devise_token_auth/confirmations'
  }

  # GET methods
  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'list_users', to: 'users#list_users'

  # POST methods
  post '/users/info', to: 'users#info'

  # Resources routes
  resources :books
  resources :publishers
  resources :categories
  resource :current_user, only: [:show]

  # API routes
  namespace :api do
    namespace :v1 do
      post 'send_test_email' => 'email#send_test_email'
    end
  end
end
