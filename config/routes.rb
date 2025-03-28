Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :maps, only: [:index, :show, :create,:update,:destroy] do
      get 'locations', to: 'locations#index_by_map'
    end

    resources :locations, only: [:index, :show, :create, :update, :destroy]
    resources :aspects, only: [:index, :show, :create, :update, :destroy]
  end
end
