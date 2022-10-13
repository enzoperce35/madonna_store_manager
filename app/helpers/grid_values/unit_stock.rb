module GridValues::UnitStock
  
  def item_class( join )
    case join.class.name
    when 'BranchInventory'
      join.inventory_item
    when 'BranchPremadeItem'
      join.premade_item
    end
  end

  # returns modified model unit_count with unit model
  def inventory_stock_of( join, abbreviated = false )
    item = item_class( join )
    
    "#{ humanize( join.stock ) } #{ abbreviated ? abbr_unit_of( item.unit ) : item.unit }"
  end 
end
