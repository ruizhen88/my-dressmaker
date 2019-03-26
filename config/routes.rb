Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :messages, only: [ :index, :new, :create ]
    resources :reviews, only: [ :new, :create ]
    resources :payments, only: [:new, :create]
  end

  resources :buyer_profiles
  resources :dressmaker_profiles do
    resources :photos, only: [:new, :create, :destroy]
  end

  get 'inbox', to: 'pages#inbox', as: 'inbox'

  resources :favourites, only: [ :new, :create, :destroy ]
end
