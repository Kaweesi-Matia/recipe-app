class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  def related_recipe_foods
    recipe_foods.includes(:food)
  end

  def total_price
    total = 0
    recipe_foods.each { |item| total += item.food.price }
    total
  end
end
