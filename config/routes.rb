Rails.application.routes.draw do
  get 'product_imports/new'
  get 'product_imports/create'
  get 'menus/index'
  get 'menu_permissions/index'
  get 'siswas/index'
  get 'rombels/index'
  get 'jurusans/index'
  get 'rayons/index'

  resources :menus
  resources :menu_permissions
  resources :rombels
  resources :jurusans
  resources :rayons

  # Login
  devise_for :users

  # Datatables
  get 'get_dataset', to: 'pages#get_dataset'

  # config/routes.rb
  resources :siswas do
    collection { post :import }
  end

  root 'menus#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end