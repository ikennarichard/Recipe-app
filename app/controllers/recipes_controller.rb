class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = Recipe.all
    # @recipes = Recipe.accessible_by(current_ability)
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
    flash[:notice] = 'Recipe was successfully deleted.'
  end
end
