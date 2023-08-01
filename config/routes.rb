Rails.application.routes.draw do
  devise_for :users
  
  root "recipes#index"
  get '/users/:id/sign_out', to: 'application#sign_out_user', as: 'sign_out_user'
  
  resources :users
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes
end
