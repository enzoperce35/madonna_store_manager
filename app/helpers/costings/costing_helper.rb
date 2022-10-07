module Costings::CostingHelper
  include Costings::Product
  include Costings::PremadeItem
  include Costings::ProductPremadeItem

  # cost of a joined inventory item
  def item_cost( join )
    return nil if join.unit_count.nil?
    
    inventory_item = join.inventory_item
    
    converted_unit = unit_convert( inventory_item.item_quantity, inventory_item.unit, join.unit )

    price_per_market_unit = inventory_item.market_price / converted_unit

    price_per_market_unit * join.unit_count
  end
  
  def net_of( product )
    return nil unless verified_and_complete?( product )
    
    price_of( product ) - cost_of( product )
  end
  
  def price_of( model )
    case model.class.name
    when 'Product'
      product_price( model )
    end
  end
  
  def cost_of( model )
    case model.class.name
    when 'Product'
      product_cost( model )
    when 'PremadeItem'
      premade_item_cost( model )
    when 'ProductPremadeItem'
      product_premade_item_cost( model )
    when 'ProductInventoryItem'
      item_cost( model )
    end
  end
end