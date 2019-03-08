Rails.application.routes.draw do
  root "trademarks#index"

  resources :trademarks

  resources :users, only: [:new, :create, :show]

  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]

  resources :admin_users, only: [:new, :create, :show]

end
