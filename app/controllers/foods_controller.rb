class FoodsController < ApplicationController
  before_action :set_user, only: %i[index new]

  def index
    @foods = Food.where(user_id: @user.id)
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)

    if @food.save
      flash[:notice] = 'Food created successfully!'
      redirect_to foods_path(current_user)
    else
      flash[:alert] = "Couldn't create food!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])

    @food.destroy
    redirect_to foods_path, notice: 'Food successfully deleted.'
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
