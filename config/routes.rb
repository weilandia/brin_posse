Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    resources :user_pairings, only: [:new, :create]
    resources :pairing_sessions, only: [:index]
  end
  resources :mentors
end
