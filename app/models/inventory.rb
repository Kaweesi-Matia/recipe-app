class Inventory < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :inventory_foods, foreign_key: 'inventory_id', dependent: :destroy

  def related_inventory_foods
    inventory_foods.includes(:food)
  end

  validates :name, presence: true, length: { in: 1..25 }
  validates :description, presence: true, length: { in: 1..250 }
end
