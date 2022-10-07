module Costings::ProductPremadeItem

  def product_premade_item_cost( model )
    return nil if model.unit_count.nil?
    
    premade_item_cost = cost_of( model.premade_item )

    return nil if premade_item_cost.nil?

    converted_unit = unit_convert( model.unit_count, model.unit, model.premade_item.unit )

    premade_item_cost * converted_unit
  end
end
