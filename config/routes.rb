Rails.application.routes.draw do
  root 'users#index'
  resources :pairing_sessions
  resources :users
  resources :mentors
end
