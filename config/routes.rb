Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :superpowers, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]

  get '/profile', to: 'dashboards#show', as: 'profile'
  get "design", to: "pages#design"

end

