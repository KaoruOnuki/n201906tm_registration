Rails.application.routes.draw do
  root "trademarks#index"
  resources :trademarks
end
