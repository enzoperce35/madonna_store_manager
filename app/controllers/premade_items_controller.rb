class PremadeItemsController < ApplicationController
  def index
    @list = params[ :list ]
    @premade_items = PremadeItem.all
  end

  def new
    @item = PremadeItem.new
    @inventory_items = InventoryItem.all
    @units = helpers.units.keys
    @types = PremadeItem.all.pluck( :item_type ).uniq
  end

  def create
    item = PremadeItem.new( item_params )

    if item.save
      redirect_back( fallback_location: premade_items_path, notice: "#{ item.name } has been successfully added" )
    else
      redirect_back( fallback_location: premade_items_path, notice: 'failed to save new item' )
    end
  end

  def edit
    @item = PremadeItem.find( params[ :id ] )
    @inventory_items = InventoryItem.all
    @valid_units = helpers.find_valid_item_units( @item )
    @types = PremadeItem.all.pluck( :item_type ).uniq
  end

  def update
    item = PremadeItem.find( params[ :id ] )

    if item.update( item_params )
      redirect_to premade_item_path( item ), method: 'get', notice: "edit successful"
    else
      redirect_back( fallback_location: premade_items_path, notice: 'edit failed' )
    end
  end

  def show
    @premade_item = PremadeItem.find( params[ :id ] )
    @premade_inventory_items = PremadeInventoryItem.where( premade_item_id: @premade_item.id )
    @complete_item = params[ :complete_item ]
  end

  def destroy
    item = PremadeItem.find( params[ :id ] )

    deny_joined_objects_with_premade( item )
    
    if item.destroy
      redirect_to premade_items_path, method: 'get', notice: "#{ item.name } has been deleted"
    else
      redirect_back( fallback_location: premade_items_path, notice: 'delete failed' )
    end
  end

  def edit_premade_inventory_item
    @premade_inventory_item = PremadeInventoryItem.find( params[ :id ] )
    
    @valid_units = helpers.find_valid_item_units( @premade_inventory_item )
  end
  
  def update_premade_inventory_item
    premade_item = PremadeInventoryItem.find( params[ :id ] )

    if premade_item.update( premade_item_params )
      redirect_to premade_item_path( premade_item.premade_item, focus: true ), method: 'get', notice: 'edit successful'
    else
      redirect_to premade_items_path, method: 'get', notice: "edit failed"
    end
  end

  private

  def item_params
    params.require( :premade_item ).permit( :name, :unit, :item_quantity, :item_type, :vouched, inventory_item_ids: [] )
  end

  def premade_item_params
    params.require( :premade_inventory_item ).permit( :unit, :unit_count )
  end

  def deny_joined_objects_with_premade( item )
    products = Product.includes( :premade_items ).where( premade_items: { id: item.id } )

    products.update_all( vouched: false ) unless products.nil?
  end
end
