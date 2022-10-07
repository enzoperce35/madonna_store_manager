module Units::Volume
  def gal_to( unit, volume )
    case unit
    when 'milliliter'
      volume.to_f * 3785
    when 'liter'
      volume.to_f * 3.785
    when 'deciliter'
      volume.to_f * 45.461
    when 'teaspoon'
      volume.to_f * 768
    when 'tablespoon'
      volume.to_f * 307.4
    when 'fluid ounce'
      volume.to_f * 153.7
    when 'cup'
      volume.to_f * 19.215
    when 'pint'
      volume.to_f * 9.608
    when 'quart'
      volume.to_f * 4.804
    when 'gallon'
      volume.to_f
    end
  end

  def quart_to( unit, volume )
    case unit
    when 'milliliter'
      volume.to_f * 946.4
    when 'liter'
      volume.to_f / 1.057
    when 'deciliter'
      volume.to_f * 9.464
    when 'teaspoon'
      volume.to_f * 192
    when 'tablespoon'
      volume.to_f * 64
    when 'fluid ounce'
      volume.to_f * 32
    when 'cup'
      volume.to_f * 4
    when 'pint'
      volume.to_f * 2
    when 'quart'
      volume.to_f
    when 'gallon'
      volume.to_f / 4
    end
  end

  def pint_to( unit, volume )
    case unit
    when 'milliliter'
      volume.to_f * 568.3
    when 'liter'
      volume.to_f / 1.76
    when 'deciliter'
      volume.to_f * 4.732
    when 'teaspoon'
      volume.to_f * 96
    when 'tablespoon'
      volume.to_f * 38.43
    when 'fluid ounce'
      volume.to_f * 16
    when 'cup'
      volume.to_f * 2
    when 'pint'
      volume.to_f
    when 'quart'
      volume.to_f / 2
    when 'gallon'
      volume.to_f / 6.661
    end
  end
  
  def cup_to( unit, volume )
    case unit
    when 'milliliter'
      volume.to_f * 236.6
    when 'liter'
      volume.to_f / 4.227
    when 'deciliter'
      volume.to_f * 2.366
    when 'teaspoon'
      volume.to_f * 48
    when 'tablespoon'
      volume.to_f * 16
    when 'fluid ounce'
      volume.to_f * 8
    when 'cup'
      volume.to_f
    when 'pint'
      volume.to_f / 2
    when 'quart'
      volume.to_f / 4
    when 'gallon'
      volume.to_f / 16
    end
  end

  def fl_oz_to( unit, volume )
    case unit
    when 'milliliter'
      volume.to_f * 29.574
    when 'liter'
      volume.to_f / 33.814
    when 'deciliter'
      volume.to_f / 3.381
    when 'teaspoon'
      volume.to_f * 6
    when 'tablespoon'
      volume.to_f * 2
    when 'fluid ounce'
      volume.to_f
    when 'cup'
      volume.to_f / 8
    when 'pint'
      volume.to_f / 16
    when 'quart'
      volume.to_f / 32
    when 'gallon'
      volume.to_f / 128
    end
  end

  def tbsp_to( unit, volume )
    case unit
    when 'milliliter'
      volume.to_f * 14.787
    when 'liter'
      volume.to_f / 67.628
    when 'deciliter'
      volume.to_f / 6.763
    when 'teaspoon'
      volume.to_f * 3
    when 'tablespoon'
      volume.to_f
    when 'fluid ounce'
      volume.to_f / 2
    when 'cup'
      volume.to_f / 16
    when 'pint'
      volume.to_f / 32
    when 'quart'
      volume.to_f / 64
    when 'gallon'
      volume.to_f / 256
    end
  end

  def tsp_to( unit, volume )
    case unit
    when 'milliliter'
      volume.to_f * 4.929
    when 'liter'
      volume.to_f / 202.9
    when 'deciliter'
      volume.to_f / 20.288
    when 'teaspoon'
      volume.to_f
    when 'tablespoon'
      volume.to_f / 3
    when 'fluid ounce'
      volume.to_f / 6
    when 'cup'
      volume.to_f / 48
    when 'pint'
      volume.to_f / 96
    when 'quart'
      volume.to_f / 192
    when 'gallon'
      volume.to_f / 768
    end
  end

  def dl_to( unit, volume )
    case unit
    when 'milliliter'
      volume.to_f * 100
    when 'liter'
      volume.to_f / 10
    when 'deciliter'
      volume.to_f
    when 'teaspoon'
      volume.to_f * 20.288
    when 'tablespoon'
      volume.to_f * 6.763
    when 'fluid ounce'
      volume.to_f * 3.381
    when 'cup'
      volume.to_f / 2.366
    when 'pint'
      volume.to_f / 4.732
    when 'quart'
      volume.to_f / 9.464
    when 'gallon'
      volume.to_f / 37.854
    end
  end

  def l_to( unit, volume )
    case unit
    when 'milliliter'
      volume.to_f * 1000
    when 'liter'
      volume.to_f
    when 'deciliter'
      volume.to_f * 10
    when 'teaspoon'
      volume.to_f * 202.9
    when 'tablespoon'
      volume.to_f * 67.628
    when 'fluid ounce'
      volume.to_f * 33.814
    when 'cup'
      volume.to_f * 4.227
    when 'pint'
      volume.to_f * 2.113
    when 'quart'
      volume.to_f * 1.057
    when 'gallon'
      volume.to_f / 3.785
    end
  end

  def ml_to( unit, volume )
    case unit
    when 'milliliter'
      volume.to_f
    when 'liter'
      volume.to_f / 1000
    when 'deciliter'
      volume.to_f / 100
    when 'teaspoon'
      volume.to_f / 4.929
    when 'tablespoon'
      volume.to_f / 14.787
    when 'fluid ounce'
      volume.to_f / 29.574
    when 'cup'
      volume.to_f / 236.6
    when 'pint'
      volume.to_f / 473.2
    when 'quart'
      volume.to_f / 946.4
    when 'gallon'
      volume.to_f / 3785
    end
  end

  def convert_volume( unit_a, unit_b, volume )
    case unit_a
    when 'milliliter'
      ml_to( unit_b, volume )
    when 'liter'
      l_to( unit_b, volume )
    when 'deciliter'
      dl_to( unit_b, volume )
    when 'teaspoon'
      tsp_to( unit_b, volume )
    when 'tablespoon'
      tbsp_to( unit_b, volume )
    when 'fluid ounce'
      fl_oz_to( unit_b, volume )
    when 'cup'
      cup_to( unit_b, volume )
    when 'pint'
      pint_to( unit_b, volume )
    when 'quart'
      quart_to( unit_b, volume )
    when 'gallon'
      gal_to( unit_b, volume )
    end
  end
end
