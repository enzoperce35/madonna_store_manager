module Phrases::PremadeItemCapacity

  def phrase_of( values )
    phrase = ''
      
    values.each_with_index do | value, i |
      product, value = value
        
      phrase += value.round(2).to_s + ' ' +
                product.pluralize
  
      return phrase if i == values.count - 1
  
      phrase += ' | '
    end
  
    phrase
  end  

  # evaluate how many product_premade_item.units can be made out of premade item's quantity
  def evaluate_product_capacity_of( joins, evaluated_joins = [] )
    joins.each do | join |
      next if join.unit_count.nil?
    
      # convert joined models' measure unit to premade item's measure unit
      converted_unit = unit_convert( join.unit_count, join.unit, join.premade_item.unit )

      premade_item_capacity = join.premade_item.item_quantity / converted_unit
    
      evaluated_joins << [ join.product.name, humanize( premade_item_capacity ) ]
    end

    evaluated_joins
  end

  def capacity_phrase_for( premade_item )
    return nil unless premade_item.products.exists?
    
    premade_item_joins = ProductPremadeItem.where( premade_item: @premade_item )

    product_capacities = evaluate_product_capacity_of( premade_item_joins )

    phrase_of( product_capacities )
  end   
end
