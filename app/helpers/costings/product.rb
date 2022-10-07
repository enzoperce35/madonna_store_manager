module Costings::Product
  
  def product_price( product )
    return nil unless verified_and_complete?( product )
    
    product.price
  end
  
  def product_cost( product )
    return nil unless verified_and_complete?( product )
    
    product_inventory_items = ProductInventoryItem.where( product: product )
    product_premade_items = ProductPremadeItem.where( product: product )

    product_items = product_inventory_items + product_premade_items

    product_items.inject( 0 ) { | sum, item | sum + cost_of( item ) }
  end
end
