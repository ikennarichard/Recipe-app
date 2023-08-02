class RecipeFoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe

  def new
    @recipe_food = @recipe.recipe_foods.build
    @foods = Food.all
  end

  def create
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)

    if @recipe_food.save
      redirect_to recipe_path(@recipe)
      flash[:notice] = 'Recipe Food was successfully created.'
    else
      render 'new'
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to recipe_recipe_foods_path(@recipe)
    flash[:notice] = 'Recipe Food was successfully deleted.'
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_food_params
    params.permit(:food_id, :quantity)
  end
end
