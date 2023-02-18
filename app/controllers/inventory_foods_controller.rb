class InventoryFoodsController < ApplicationController
  before_action :set_inventory

  def new
    @inventory_food = InventoryFood.new
    @foods = Food.all
  end

  def create
    @inventory_food = InventoryFood.new(inventory_food_params)
    @inventory_food.inventory_id = @inventory.id

    respond_to do |format|
      if @inventory_food.save
        format.html { redirect_to inventory_path(@inventory.id), notice: 'Inventory food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy

    respond_to do |format|
      format.html { redirect_to inventory_path(@inventory.id), notice: 'Inventory food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
