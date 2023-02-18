class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :user, null: false, foreign_key: true, on_delete: :cascade
    add_reference :inventory_foods, :inventory, null: false, foreign_key: true, on_delete: :cascade
    add_reference :inventory_foods, :food, null: false, foreign_key: true, on_delete: :cascade
  end
end
