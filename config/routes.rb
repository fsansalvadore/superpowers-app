Rails.application.routes.draw do

  devise_for :users
  root to: 'superpowers#index'

  resources :superpowers, only: [:index, :show, :new, :create ] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update, :destroy]

  get '/profile', to: 'users#show', as: 'profile'
  get "design", to: "pages#design"
end

