module Validators::ProductInventoryItem
  
  def complete_product_inventory_item_data_values?( model )
    !model.unit_count.nil?
  end
end
