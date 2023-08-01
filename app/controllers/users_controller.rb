class UsersController < ApplicationController
  def index
    @users = User.all
    flash[:notice] = 'You are successfully logged in'
  end

  def show
    @user = User.find(params[:id])
  end
end
