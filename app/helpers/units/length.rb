module Units::Length
  def yrd_to( unit, length )
    case unit
    when 'millimeter'
      length.to_f * 914.4
    when 'centimeter'
      length.to_f * 91.44
    when 'meter'
      length.to_f / 1.094
    when 'inch'
      length.to_f * 36
    when 'yard'
      length.to_f / 36
    end
  end
    
  def in_to( unit, length )
    case unit
    when 'millimeter'
      length.to_f * 25.4
    when 'centimeter'
      length.to_f * 2.54
    when 'meter'
      length.to_f / 39.37
    when 'inch'
      length.to_f
    when 'yard'
      length.to_f / 36
    end
  end
    
  def m_to( unit, length )
    case unit
    when 'millimeter'
      length.to_f * 1000
    when 'centimeter'
      length.to_f * 100
    when 'meter'
      length.to_f / 100
    when 'inch'
      length.to_f * 39.37
    when 'yard'
      length.to_f * 1.094
    end
  end
    
  def cm_to( unit, length )
    case unit
    when 'millimeter'
      length.to_f * 10
    when 'centimeter'
      length.to_f
    when 'meter'
      length.to_f / 100
    when 'inch'
      length.to_f / 2.54
    when 'yard'
      length.to_f / 91.44
    end
  end
    
  def mm_to( unit, length )
    case unit
    when 'millimeter'
      length.to_f
    when 'centimeter'
      length.to_f / 10
    when 'meter'
      length.to_f / 1000
    when 'inch'
      length.to_f / 25.4
    when 'yard'
      length.to_f / 914.4
    end
  end
    
  def convert_length( unit_a, unit_b, length )
    case unit_a
    when 'millimeter'
      mm_to( unit_b, length )
    when 'centimeter'
      cm_to( unit_b, length )
    when 'meter'
      m_to( unit_b, length )
    when 'inch'
      in_to( unit_b, length )
    when 'yard'
      yrd_to( unit_b, length )
    end
  end
end