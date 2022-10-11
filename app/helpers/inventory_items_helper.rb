module InventoryItemsHelper

  def object_of( join_model )
    case join_model.class.name
    when 'ProductInventoryItem'
      join_model.product
    when 'PremadeInventoryItem'
      join_model.premade_item
    end
  end

  



  
  def market_price_of( inventory_item )
    "#{ humanize( inventory_item.market_price, true ) } / 
     #{ humanize( inventory_item.item_quantity ) }
     #{ abbr_unit_of( inventory_item.unit ) }"
  end 
end
