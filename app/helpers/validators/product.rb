module Validators::Product 
    
  def product_has_no?( *components )
    components = components.inject( 0 ) { | sum , c | sum + c.count }
  
    components.zero?
  end

  def invalid?( product_premade_items )
    return false if product_premade_items.nil? # product w/out premade_items is valid
    
    product_premade_items.each do | joint |
      if joint.unit_count.nil? || !verified_and_complete?( joint.premade_item )
        return true
        
        break
      end
    end

    false
  end
  
  def complete_product_data_values?( product )
    product_items = ProductInventoryItem.where( product: product )
    product_premade_items = ProductPremadeItem.where( product: product )

    return false if invalid?( product_premade_items ) ||
                    null_data_is_detected_from?( product_items ) ||
                    product_has_no?( product_items, product_premade_items )
 
    true
  end
end
