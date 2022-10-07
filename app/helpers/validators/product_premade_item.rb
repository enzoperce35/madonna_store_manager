module Validators::ProductPremadeItem
  
  def complete_product_premade_item_data_values?( model )
    !model.unit_count.nil? && verified_and_complete?( model.premade_item )
  end
end
