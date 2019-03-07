Rails.application.routes.draw do
  root "trademarks#index"
  resources :trademarks
  resources :users, only: [:new, :create, :show]
end
