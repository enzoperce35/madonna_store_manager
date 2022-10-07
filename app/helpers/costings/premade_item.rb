module Costings::PremadeItem
  
  # returns the collective cost of joined inventory items
  def accumulated_cost_of( joins, cost = 0 )
    
    joins.each do | join |
      item_cost = item_cost( join )
      
      cost += item_cost
    end
    cost
  end
  
  def premade_item_cost( premade_item )
    return nil unless verified_and_complete?( premade_item )
    
    inventory_item_joins = PremadeInventoryItem.where( premade_item: premade_item )

    accumulated_cost_of( inventory_item_joins )
  end
end