class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[show edit update destroy toggle_public_status]

  def index
    @recipes = Recipe.all
    # @recipes = Recipe.accessible_by(current_ability)
  end

  def show
    @recipe = Recipe.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'errors/not_found', status: :not_found
  end

  def new
    @recipe = Recipe.new
  end

  def toggle_public_status
    @recipe = current_user.recipes.find(params[:id])
    @recipe.toggle_public_status

    redirect_to recipe_path(@recipe)
    flash[:notice] = if @recipe.public?
                       'Recipe is set to public'
                     else
                       'Recipe is set to private'
                     end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
    flash[:notice] = 'Recipe was successfully deleted.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
