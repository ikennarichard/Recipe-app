class DropRecipesFoodsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :recipes_foods
  end
end
