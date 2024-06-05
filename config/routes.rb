Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]

  resources :orders, only: [:index, :show, :create]
  resources :products, only: [:index]

  get 'calculate_route', to: 'orders#calculate_route'

  get 'add_product_to_cart', to: 'products#add_to_cart'
  get 'clean_cart', to: 'products#clean_cart'
  get 'cart', to: 'products#cart'

  get "up" => "rails/health#show", as: :rails_health_check
end
