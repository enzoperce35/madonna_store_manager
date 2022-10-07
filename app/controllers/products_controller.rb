class ProductsController < ApplicationController
  def index
    @list = params[ :list ]
    @products = Product.all
  end

  def new
    @product = Product.new
    @items = InventoryItem.all
    @premade_items = PremadeItem.all
  end

  def create
    product = Product.new( product_params )

    if product.save
      redirect_back( fallback_location: products_path, notice: "#{ product.name } has been successfully added" )
    else
      redirect_back( fallback_location: products_path, notice: 'failed to save new product' )
    end
  end

  def edit
    @product = Product.find( params[ :id ] )
    @premade_items = PremadeItem.all
    @items = InventoryItem.all
  end

  def update
    product = Product.find( params[ :id ] )

    if product.update( product_params )
      redirect_to product_path( product ), method: 'get', notice: "edit successful"
    else
      redirect_back( fallback_location: products_path, notice: 'edit failed' )
    end
  end

  def show
    @product = Product.find( params[ :id ] )
    
    inventory_items = ProductInventoryItem.where( product_id: @product.id )
    premade_items = ProductPremadeItem.where( product_id: @product.id )
    @product_items = premade_items + inventory_items

    @complete_item = params[ :complete_item ]
  end

  def destroy
    product = Product.find( params[ :id ] )

    if product.destroy
      redirect_to products_path, method: 'get', notice: "#{ product.name } has been deleted"
    else
      redirect_back( fallback_location: products_path, notice: 'delete failed' )
    end
  end

  def edit_product_inventory_item
    @product_item = ProductInventoryItem.find( params[ :id ] )
    
    @valid_units = helpers.find_valid_item_units( @product_item )
  end
  
  def update_product_inventory_item
    product_item = ProductInventoryItem.find( params[ :id ] )

    if product_item.update( product_item_params )
      redirect_to product_path( product_item.product, focus: true ), method: 'get', notice: 'edit successful'
    else
      redirect_to products_path, method: 'get', notice: "edit failed"
    end
  end
  
  def edit_product_premade_item
    @product_premade_item = ProductPremadeItem.find( params[ :id ] )
    
    @valid_units = helpers.find_valid_item_units( @product_premade_item )
  end
  
  def update_product_premade_item
    product_item = ProductPremadeItem.find( params[ :id ] )

    if product_item.update( product_premade_params )
      redirect_to product_path( product_item.product, focus: true ), method: 'get', notice: 'edit successful'
    else
      redirect_to products_path, method: 'get', notice: "edit failed"
    end
  end

  private

  def product_params
    params.require( :product ).permit( :name, :price, :min_net, :vouched, inventory_item_ids: [], premade_item_ids: [] )
  end
  
  def product_item_params
    params.require( :product_inventory_item ).permit( :unit, :unit_count )
  end
  
  def product_premade_params
    params.require( :product_premade_item ).permit( :unit, :unit_count )
  end
end
