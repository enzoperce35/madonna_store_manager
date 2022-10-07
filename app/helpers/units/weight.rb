module Units::Weight
  def oz_to( unit, mass )
    case unit
    when 'milligram'
      mass.to_f * 28350
    when 'gram'
      mass.to_f * 28.35
    when 'kilogram'
      mass.to_f / 35.274
    when 'pound'
      mass.to_f / 16
    when 'ounce'
      mass.to_f
    end
  end
  
  def lb_to( unit, mass )
    case unit
    when 'milligram'
      mass.to_f * 453600
    when 'gram'
      mass.to_f * 453.6
    when 'kilogram'
      mass.to_f / 2.205
    when 'pound'
      mass.to_f
    when 'ounce'
      mass.to_f * 16
    end
  end
  
  def kg_to( unit, mass )
    case unit
    when 'milligram'
      mass.to_f * 1e+6
    when 'gram'
      mass.to_f * 1000
    when 'kilogram'
      mass.to_f
    when 'pound'
      mass.to_f * 2.205
    when 'ounce'
      mass.to_f * 35.274
    end
  end
  
  def g_to( unit, mass )
    case unit
    when 'milligram'
      mass.to_f * 1000
    when 'gram'
      mass.to_f
    when 'kilogram'
      mass.to_f / 1000
    when 'pound'
      mass.to_f / 453.6
    when 'ounce'
      mass.to_f / 28.35
    end
  end
  
  def mg_to( unit, mass )
    case unit
    when 'milligram'
      mass.to_f
    when 'gram'
      mass.to_f / 1000
    when 'kilogram'
      mass.to_f / 1e+6
    when 'pound'
      mass.to_f / 453600
    when 'ounce'
      mass.to_f / 28350
    end
  end
  
  def convert_weight( unit_a, unit_b, mass )
    case unit_a
    when 'milligram'
      mg_to( unit_b, mass )
    when 'gram'
      g_to( unit_b, mass )
    when 'kilogram'
      kg_to( unit_b, mass )
    when 'pound'
      lb_to( unit_b, mass )
    when 'ounce'
      oz_to( unit_b, mass )
    end
  end
end