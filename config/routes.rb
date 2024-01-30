Rails.application.routes.draw do
  # config/routes.rb
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'registrations'
  }

  get "up" => "rails/health#show", as: :rails_health_check

  resources :books
  resources :publishers
  resources :categories
  resources :users


  namespace :api do
    namespace :v1 do
      post 'send_test_email' => 'email#send_test_email'
    end
  end

end
