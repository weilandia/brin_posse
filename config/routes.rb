Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    resources :user_pairings, only: [:new, :create]
    resources :pairing_sessions, only: [:index]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/users/:id/exercisms', to: 'users#update_exercism_stats'
    end
  end

  resources :mentors
end
