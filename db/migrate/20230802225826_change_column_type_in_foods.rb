class ChangeColumnTypeInFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :price, :integer
  end
end
