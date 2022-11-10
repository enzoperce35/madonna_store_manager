class TransfersController < ApplicationController

  def show
  end

  def update
   @transfer = Transfer.find( params[:id] )
   
   if @transfer.update( transfer_params )
     redirect_to root_path
   else
     redirect_back
   end
  end

  def destroy
    @transfer = transfer.find( params[:id] )
    
    if @transfer.destroy
      redirect_to root_path
    end
  end

  def edit
    @transfer.items.build
  end

  def create
    @transfer = Transfer.new( transfer_params( params[ :item_class ]) )
    
    if @transfer.save
      redirect_to root_path, notice: 'success'
    else
      redirect_back(fallback_location: 'new', notice: 'failed')
    end
  end

  def new
    @transfer_branch = Branch.find( params[ :branch_id ] )
    @item_class = params[ :item_class ]
    
    @items = transfer_items( @item_class )
    @transfer = Transfer.new

    item_build( @transfer, @item_class )
  end

  def selected_item_unit
    @item = selected_item( params[ :item_class ], params[ :id ] )
    
    respond_to do |format|
      format.html
      format.json { render json: { "unit": helpers.abbr_unit_of( @item.unit ) } }
    end
  end

  private
  
  def transfer_params( item_class )
    case item_class
    when 'market items'
      params.require( :transfer ).permit( :sender, :recipient, :received, :note, inventory_item_transfers_attributes: InventoryItemTransfer.attribute_names.map( &:to_sym ).push( :_destroy ) )
    when 'premade items'
      params.require( :transfer ).permit( :sender, :recipient, :received, :note, premade_item_transfers_attributes: PremadeItemTransfer.attribute_names.map( &:to_sym ).push( :_destroy ) )
    end
  end

  def transfer_items( item_class )
    case item_class
    when 'premade items'
      current_user.branch.premade_items
    when 'market items'
      current_user.branch.inventory_items
    end
  end

  def item_build( transfer, item_class )
    case item_class
    when 'premade items'
      transfer.premade_item_transfers.build
    when 'market items'
      transfer.inventory_item_transfers.build
    end
  end

  def selected_item( item_class, id )
    case item_class
    when 'premade items'
      PremadeItem.find( id )
    when 'market items'
      InventoryItem.find( id )
    end
  end
end
