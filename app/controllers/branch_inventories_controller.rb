class BranchInventoriesController < ApplicationController
  # store managers choose their branch's inventory items from the main lists of all inventory items
  
  def index
    @list = params[ :list ]
    @branch = current_user.branches.first
    @items = InventoryItem.all.order( :name )
    @branch_items = BranchInventory.where( branch_id: @branch.id )
  end

  def edit
    @branch_item = BranchInventory.find( params[ :id ] )
  end

  def update
    branch_item = BranchInventory.find( params[ :id ] )

    if branch_item.update( branch_item_params )
      redirect_to branch_inventories_path, notice: "#{ branch_item.inventory_item.name } updated"
    else
      redirect_back( fallback_location: root_path, notice: "update failed" )
    end
  end

  def update_branch_inventory_items_list
    branch = Branch.find( params[ :id ] )

    if branch.update( branch_item_params )
      redirect_to branch_inventories_path, notice: "#{ branch.name } inventory items updated"
    else
      redirect_to root_path, notice: "update failed"
    end
  end

  private

  def branch_item_params
    params.require( :branch_inventory ).permit( :inventory_stock, inventory_item_ids: [] )
  end
end
