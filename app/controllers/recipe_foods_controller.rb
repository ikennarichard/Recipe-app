class RecipeFoodsController < ApplicationController
  # load_and_authorize_resource

  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = @recipe.recipe_foods.build(recipe_foods_params)
    if @food.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    authorize! :delete, @recipe_food
    if @recipe_food.destroy
      flash[:notice] = 'Recipe ingredient deleted successfully'
      redirect_to recipes_path
    else
      flash[:notice] = 'Error, ingredient not deleted'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_foods).permit(:quantity, :food_id)
  end
end
