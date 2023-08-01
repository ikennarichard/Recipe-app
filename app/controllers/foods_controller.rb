class FoodsController < ApplicationController
  def index
    # @user = User.find(params[:user_id])
    # @food = Food.where(user_id: @user.id)
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
