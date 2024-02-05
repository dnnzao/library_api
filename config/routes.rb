Rails.application.routes.draw do
  # Devise Token Auth routes
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'registrations'
  }

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Confirmation success route
  get 'confirmation_success', to: 'users#confirmation_success', as: :confirmation_success

  # Resources routes
  resources :books
  resources :publishers
  resources :categories
  resources :users

  # API routes
  namespace :api do
    namespace :v1 do
      post 'send_test_email' => 'email#send_test_email'
    end
  end
end
