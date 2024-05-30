Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]

  resources :orders, only: [:index, :show]
  resources :products, only: [:index]

  get 'calculate_route', to: 'orders#calculate_route'

  get "up" => "rails/health#show", as: :rails_health_check
end
