class PremadeItemsController < ApplicationController
  def index
    @items = PremadeItem.all
  end

  def new
    @item = PremadeItem.new
    @types = PremadeItem.all.pluck( :item_type ).uniq
    @units = PremadeItem.all.pluck( :unit ).uniq
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
    @types = PremadeItem.all.pluck( :item_type ).uniq
    @units = PremadeItem.all.pluck( :unit ).uniq
  end

  def update
    item = PremadeItem.find( params[ :id ] )

    if item.update( item_params )
      redirect_to premade_items_path, method: 'get', notice: "edit successful"
    else
      redirect_back( fallback_location: premade_items_path, notice: 'edit failed' )
    end
  end

  def show
    @item = PremadeItem.find( params[ :id ] )
  end

  def destroy
    item = PremadeItem.find( params[ :id ] )

    if item.destroy
      redirect_to premade_items_path, method: 'get', notice: "#{ item.name } has been deleted"
    else
      redirect_back( fallback_location: premade_items_path, notice: 'delete failed' )
    end
  end

  private

  def item_params
    params.require( :premade_item ).permit( :name, :item_type, :unit, :sale_deduction )
  end
end
