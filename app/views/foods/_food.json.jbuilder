json.extract! food, :id, :name, :measurment_unit, :price, :created_at, :updated_at
json.url food_url(food, format: :json)
