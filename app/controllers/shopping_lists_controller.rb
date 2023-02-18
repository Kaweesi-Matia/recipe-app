class ShoppingListsController < ApplicationController
  before_action :set_shopping_list

  def index
    @food_list = compare
    @total_price = sum(@food_list)
  end

  def new
    @inventories = Inventory.where(user_id: current_user.id)
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    respond_to do |format|
      format.html do
        redirect_to "/shopping_list/#{@recipe.id}/#{@inventory.id}", notice: 'Shopping list was successfully generated.'
      end
    end
  end

  private

  def compare
    @inventory = Inventory.find(params[:inventory_id])
    inv_foods = @inventory.related_inventory_foods.pluck(:food_id)
    rec_foods = @recipe.related_recipe_foods
    list = []
    rec_foods.each do |item|
      list.push(item) unless inv_foods.include? item.food_id
    end
    list
  end

  def sum(list)
    total = 0
    list.each { |item| total += item.food.price }
    total
  end

  def set_shopping_list
    @recipe = Recipe.find(params[:recipe_id])
  end

  def shopping_list_params
    params.require(:shopping_list).permit(:inventory_id)
  end
end
