Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]

  resources :orders, only: [:index]
  resources :products, only: [:index]

  get "up" => "rails/health#show", as: :rails_health_check
end
