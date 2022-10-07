module GridValues::UnitQuantity
  
  # returns modified model unit_count with unit model
  def unit_quantity_of( model, abbreviated = false )
    "#{ humanize( model.item_quantity ) } #{ abbreviated ? abbr_unit_of( model.unit ) : model.unit }"
  end 
end
