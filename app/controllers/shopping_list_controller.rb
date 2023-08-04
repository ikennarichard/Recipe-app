# app/controllers/shopping_list_controller.rb
class ShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe_foods = RecipeFood.includes(recipe: :user, food: :user)
    .where(users: { id: current_user.id })
    .where('recipe_foods.quantity > foods.quantity')

    @total_food_items = @recipe_foods.sum { |item| item.quantity - item.food.quantity }
    @total_price = @recipe_foods.sum { |item| (item.quantity - item.food.quantity) * item.food.price }
  end
end
