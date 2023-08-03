class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = Recipe.includes(:user).all
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

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render 'new'
    end
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

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
