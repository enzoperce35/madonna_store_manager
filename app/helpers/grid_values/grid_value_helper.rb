module GridValues::GridValueHelper
  include GridValues::UnitQuantity
  include GridValues::UnitStock

  def abbr_unit_of( unit )
    units[ unit ][ 'abbr' ]
  end
  
  def ommit_zero_decimal(num)
    num == num.to_i ? num.to_i : num
  end
  
  def scientific_notation?( number )
    number.to_s.include?('-')
  end

  def humanize( number, is_price = false )
    
    number = 
    if scientific_notation?( number )
      "%.8f" % number
    else
      ommit_zero_decimal( number )
    end

    is_price ? "\u{20B1}".encode('utf-8') + number.to_s : number
  end
end
