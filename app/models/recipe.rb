class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy, foreign_key: :recipe_id
  has_many :foods, through: :recipe_foods
  validates :name, :preparation_time, :cooking_time, :description, presence: true

  def toggle_public_status
    self.public = !public
    save
  end
end
