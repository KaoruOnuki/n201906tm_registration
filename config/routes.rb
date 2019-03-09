Rails.application.routes.draw do
  root "sessions#new"

  resources :trademarks

  resources :users, only: [:new, :create, :show]

  # get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]

  resources :admin_users, only: [:new, :create, :show]

  resources :states

  resources :contacts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
