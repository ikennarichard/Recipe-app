class Food < ApplicationRecord
  belongs_to :user, foreign_key: :user_id

  validates :name, presence: true, uniqueness: true, length: { maximum: 250 }
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
