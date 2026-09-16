Rails.application.routes.draw do
  # Login / Authentication
  devise_for :users

  # RESTful Resources
  resources :menus
  resources :menu_permissions
  resources :rombels
  resources :jurusans
  resources :rayons

  resources :siswas do
    collection { post :import }
  end

  resources :absensis do
    collection do
      post :bulk_create
    end
  end

  resources :product_imports, only: [:new, :create]

  # RESTful API v1
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'auth/login', to: 'authentication#login'
      post 'auth/logout', to: 'authentication#logout'

      resources :siswas, only: [:index, :show, :create, :update, :destroy]
      resources :absensis, only: [:index, :show, :create, :update]
      resources :rombels, only: [:index, :show]
      resources :rayons, only: [:index, :show]
      resources :jurusans, only: [:index, :show]
    end
  end

  root 'menus#index'
end