class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :preparation_time, default: 0
      t.float :cooking_time, default: 0
      t.text :description
      t.boolean :public, default: false
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
