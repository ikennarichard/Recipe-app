class FoodsController < ApplicationController
  before_action :set_user, only: %i[index new]

  def set_user
    @user = User.includes(:foods).find(current_user.id)
  end

  def index
    @foods = Food.where(user_id: @user.id)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      flash[:notice] = 'Food created successfully!'
      redirect_to foods_path(current_user)
    else
      flash[:alert] = "Couldn't create food!"
      render :new, status: :unprocessable_entity
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
