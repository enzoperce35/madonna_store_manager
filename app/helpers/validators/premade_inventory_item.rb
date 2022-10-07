module Validators::PremadeInventoryItem
  
  def complete_premade_inventory_item_data_values?( model )
    !model.unit_count.nil?
  end
end
