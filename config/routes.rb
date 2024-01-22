Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :books do
    collection do
      get 'search_by_name_or_id'
    end
  end

  resources :publishers do
    collection do
      get 'search_by_name_or_id'
    end
  end

  resources :categories do
    collection do
      get 'search_by_name_or_id'
    end
  end
end
