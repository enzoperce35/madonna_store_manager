class BranchesController < ApplicationController
  
  # store managers choose their branch's inventory items from the main lists of all inventory items
  
  # select branch inventory items
  def inventory_items
    @branch = current_user.branches.first
    @items = InventoryItem.all.order( :name )
    @active_items = @branch.inventory_items.pluck( :name )
  end

  # update branch inventory items
  def update_items
    branch = Branch.find( params[ :id ] )

    if branch.update( branch_params )
      redirect_to root_path, notice: "#{ branch.name } inventory items updated"
    else
      redirect_back( fallback_location: root_path, notice: 'update failed' )
    end
  end

  # store managers choose their branch's premade items from the main lists of all premade items

  # select branch premade items
  def premade_items
    @branch = current_user.branches.first
    @items = PremadeItem.all.order( :name )
    @active_items = @branch.premade_items.pluck( :name )
  end

  # update branch premade items
  def update_premade_items
    branch = Branch.find( params[ :id ] )

    if branch.update( branch_params )
      redirect_to root_path, notice: "#{ branch.name } premade items updated"
    else
      redirect_back( fallback_location: root_path, notice: 'update failed' )
    end
  end

  private

  def branch_params
    params.require( :branch ).permit( inventory_item_ids: [], premade_item_id: [] )
  end
end
