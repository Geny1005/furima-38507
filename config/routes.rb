Rails.application.routes.draw do
  
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :destroy, :edit, :update, :show]

  root to: 'orders#index'
  resources :orders, only:[:create]
end
    