class Food < ApplicationRecord
  has_many :inventory_foods
  has_many :recipe_foods

  validates :name, presence: true, length: { in: 1..25 }
  validates :measurment_unit, presence: true, length: { in: 1..25 }
  validates :price, presence: true
end
