Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :books
  resources :publishers
  resources :categories
end
