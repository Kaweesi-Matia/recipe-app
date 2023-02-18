class InventoryFood < ApplicationRecord
  belongs_to :inventory, class_name: 'Inventory'
  belongs_to :food, class_name: 'Food'

  validates :quantity, presence: true
end
