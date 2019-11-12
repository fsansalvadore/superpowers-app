Rails.application.routes.draw do

  devise_for :users
  root to: 'superpowers#index'
  resources :superpowers

  get "design", to: "pages#design"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :superpowers, only: [:index, :show, :new, :create ] do
    resources :bookings, only: [:new, :create, :update]
  end
  get '/profile', to: 'users#show', as: 'profile'

end

