Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders, only: [ :index, :show, :create, :edit, :update ] do
    resources :messages, only: [ :index, :create ]
    resources :reviews, only: [ :create ]
  end

  resources :buyer_profiles
  resources :dressmaker_profiles

  resources :favourites, only: [ :create, :destroy ]
end
