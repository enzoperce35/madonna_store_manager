class InventoryItemsController < ApplicationController
  def index
    @items = InventoryItem.all
  end

  def new
    @item = InventoryItem.new
    @types = InventoryItem.all.pluck( :item_type ).uniq
    @units = InventoryItem.all.pluck( :unit ).uniq
  end

  def create
    item = InventoryItem.new( item_params )

    if item.save
      redirect_back( fallback_location: inventory_items_path, notice: "#{ item.name } has been successfully added" )
    else
      redirect_back( fallback_location: inventory_items_path, notice: 'failed to save new item' )
    end
  end

  def edit
    @item = InventoryItem.find( params[ :id ] )
    @types = InventoryItem.all.pluck( :item_type ).uniq
    @units = InventoryItem.all.pluck( :unit ).uniq
  end

  def update
    item = InventoryItem.find( params[ :id ] )

    if item.update( item_params )
      redirect_to inventory_items_path, method: 'get', notice: "edit successful"
    else
      redirect_back( fallback_location: inventory_items_path, notice: 'edit failed' )
    end
  end

  def show
    @item = InventoryItem.find( params[ :id ] )
  end

  def destroy
    item = InventoryItem.find( params[ :id ] )

    if item.destroy
      redirect_to inventory_items_path, method: 'get', notice: "#{ item.name } has been deleted"
    else
      redirect_back( fallback_location: inventory_items_path, notice: 'delete failed' )
    end
  end

  private

  def item_params
    params.require( :inventory_item ).permit( :name, :item_type, :unit, :sale_deduction )
  end
end
