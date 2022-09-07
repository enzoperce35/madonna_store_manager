class BranchesController < ApplicationController
  def products
    @branch = current_user.branches.first
    @products = Product.all.order( :name )
    @active_products = @branch.products.pluck( :name )
  end

  def update_products
    branch = Branch.find( params[ :id ] )

    if branch.update( branch_params )
      redirect_to root_path, notice: "#{ branch.name } products updated"
    else
      redirect_back( fallback_location: root_path, notice: 'update failed' )
    end
  end
  
  def inventory_items
    @branch = current_user.branches.first
    @items = InventoryItem.all.order( :name )
    @active_items = @branch.inventory_items.pluck( :name )
  end

  def update_items
    branch = Branch.find( params[ :id ] )

    if branch.update( branch_params )
      redirect_to root_path, notice: "#{ branch.name } inventory items updated"
    else
      redirect_back( fallback_location: root_path, notice: 'update failed' )
    end
  end

  private

  def branch_params
    params.require( :branch ).permit( product_ids: [], inventory_item_ids: [] )
  end
end
