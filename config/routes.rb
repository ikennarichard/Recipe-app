Rails.application.routes.draw do
  devise_for :users
  
  root "foods#index"
  get '/users/:id/sign_out', to: 'application#sign_out_user', as: 'sign_out_user'
  
  resources :users
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes do
    resources :recipe_foods
  end
  resources :public_recipes

  put '/recipes/:id/toggle_public_status', to: 'recipes#toggle_public_status', as: 'toggle_public_status'
  get '/general_shopping_list/', to: 'shopping_list#index', as: 'shopping_list'
end
