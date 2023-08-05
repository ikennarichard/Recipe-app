class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, unless: :public_recipe?

  def sign_out_user
    sign_out current_user
    redirect_to root_path
  end

  def public_recipe?
    controller_name == 'public_recipes' && action_name == 'index'
  end
end
