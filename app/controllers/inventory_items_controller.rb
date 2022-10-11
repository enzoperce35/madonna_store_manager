# alliased as MarketItems for clearer user view

class InventoryItemsController < ApplicationController
  def index
    @inventory_items = InventoryItem.all
  end

  def new
    @item = InventoryItem.new
    @types = InventoryItem.all.pluck( :item_type ).uniq
    @units = helpers.units.keys
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
    @valid_units = helpers.find_valid_item_units( @item )
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
    product_items = ProductInventoryItem.where( inventory_item: @item)
    premade_items = PremadeInventoryItem.where( inventory_item: @item)

    @item_premade_products = product_items + premade_items
  end

  def destroy
    item = InventoryItem.find( params[ :id ] )
    
    deny_joined_objects_with_inventory( item )
    
    if item.destroy
      redirect_to inventory_items_path, method: 'get', notice: "#{ item.name } has been deleted"
    else
      redirect_back( fallback_location: inventory_items_path, notice: 'delete failed' )
    end
  end

  private

  def item_params
    params.require( :inventory_item ).permit( :name, :item_type, :item_quantity, :unit, :unit_note, :market_price )
  end

  def deny_joined_objects_with_inventory( item )
    products = Product.includes( :inventory_items ).where( inventory_items: { id: item.id } )
    premade_items = PremadeItem.includes( :inventory_items ).where( inventory_items: { id: item.id } )

    products.update_all( vouched: false ) unless products.nil?
    premade_items.update_all( vouched: false ) unless premade_items.nil?
  end
end
