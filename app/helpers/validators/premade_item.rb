module Validators::PremadeItem

  def no_null_data_is_detected_from?( model_joins )
    model_joins.where( unit_count: nil ).count == 0
  end
  
  def premade_item_has_no?( inventory_items )
    inventory_items.count.zero?
  end
  
  def complete_premade_item_data_values?( premade_item )
    premade_inventory_items = PremadeInventoryItem.where( premade_item: premade_item )

    return false if premade_item_has_no?( premade_inventory_items ) ||
                    null_data_is_detected_from?( premade_inventory_items )

    true
  end
end