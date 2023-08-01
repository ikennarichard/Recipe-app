Rails.application.routes.draw do
  devise_for :users
  
  root "users#index"
  
  resources :users
  resources :foods, only: [:index, :show, :new, :create, :destroy]
end
