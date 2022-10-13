class BranchPremadeItemsController < ApplicationController
  # store managers choose their branch's premade items from the main lists of all premade items

  def index
    @list = params[ :list ]
    @branch = current_user.branch
    @items = PremadeItem.all.order( :name )
    @branch_premade_items = BranchPremadeItem.where( branch_id: @branch.id )
  end

  def edit
    @branch_item = BranchPremadeItem.find( params[ :id ] )
  end

  def update
    branch_item = BranchPremadeItem.find( params[ :id ] )

    if branch_item.update( branch_item_params )
      redirect_to branch_premade_items_path, notice: "#{ branch_item.premade_item.name } updated"
    else
      redirect_back( fallback_location: root_path, notice: "update failed" )
    end
  end

  def update_branch_premade_items_list
    branch = Branch.find( params[ :id ] )

    if branch.update( branch_item_params )
      redirect_to branch_premade_items_path, notice: "#{ branch.name } premade items updated"
    else
      redirect_to root_path, notice: "update failed"
    end
  end

  def edit_individual_branch_premade_items
    @branch_premade_items = BranchPremadeItem.all
  end
  
  def update_individual_branch_premade_items
    @branch_premade_items = BranchPremadeItem.update( params[ :branch_premade_items ].keys, params[ :branch_premade_items ].values).reject { |p| p.errors.empty? }
  
    if @branch_premade_items.empty?
      flash[:notice] = "branch_premade_items updated"
      
      redirect_to branch_premade_items_path
    else
      render :action => "edit_individual_branch_premade_items"
    end
  end

  private

  def branch_item_params
    params.require( :branch_premade_item ).permit( :stock, :margin, premade_item_ids: [] )
  end
end
