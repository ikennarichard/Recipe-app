class RenameFoodsRecipestoRecipesFoods < ActiveRecord::Migration[7.0]
  def change
    rename_table :foods_recipes, :recipes_foods
  end
end
