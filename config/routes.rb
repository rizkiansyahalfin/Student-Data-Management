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

  resources :product_imports, only: [:new, :create]

  root 'menus#index'
end