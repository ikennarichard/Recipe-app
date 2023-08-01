Rails.application.routes.draw do
  devise_for :users
  
  root "recipes#index"
  get '/users/:id/sign_out', to: 'application#sign_out_user', as: 'sign_out_user'
  
  # resources :foods
  resources :recipes
end
