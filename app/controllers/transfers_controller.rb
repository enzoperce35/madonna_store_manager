class TransfersController < ApplicationController

  def show
    @item = InventoryItem.find( params[:id] )
   
    respond_to do |format|
      format.html
      format.json { render json: { "unit": helpers.abbr_unit_of( @item.unit ) } }
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def create
    @transfer = Transfer.new( transfer_params )
    
    if @transfer.save
      redirect_to root_path, notice: 'success'
    else
      
      redirect_back(fallback_location: 'new', notice: 'failed')
    end
  end

  def new
    @transfer_branch = Branch.find( params[ :branch_id ] )
    
    @branch_inventory_items = current_user.branch.inventory_items
    @transfer = Transfer.new

    @transfer.inventory_item_transfers.build
  end

  private

  def transfer_params
    params.require( :transfer ).permit( :sender, :recipient, :received, :note, inventory_item_transfers_attributes: InventoryItemTransfer.attribute_names.map( &:to_sym ).push( :_destroy ) )
  end
end
