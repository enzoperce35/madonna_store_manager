require 'csv'

module Units::UnitHelper
  include Units::Volume
  include Units::Weight
  include Units::Length
  
  def units( unit = {} )
    file = File.new('unit_measures.csv', 'r')

    csv = CSV.new(file)
  
    csv.each { |row| unit.store( row[0], { 'class' => row[1], 'abbr' => row[2]}) }
    
    unit
  end

  def count_decimals( float )
    bd = BigDecimal( float.to_s )

    zeros = bd.exponent < 0 ? bd.exponent.abs : 0

    zeros
  end

  # returns convertible unit sets for a unit 
  def find_valid_item_units( record )
    
    market_unit =
    case record.class.name
    when 'ProductInventoryItem'
      record.inventory_item.unit
    when 'ProductPremadeItem'
      record.premade_item.unit
    when 'PremadeInventoryItem'
      record.inventory_item.unit
    when 'InventoryItem'
      record.unit
    when 'PremadeItem'
      record.unit
    end

    unit_class = units[ market_unit ][ 'class' ]

    units.select{ | key, hash | hash[ "class" ] == unit_class }.keys
  end
 
  # convert amount of unit_a to unit_b
  def unit_convert( amount, unit_a, unit_b )
    group = units[ unit_a ]['class']

    case group
    when 'volume'
      convert_volume( unit_a, unit_b, amount )
    when 'weight'
      convert_weight( unit_a, unit_b, amount )
    when 'length'
      convert_length( unit_a, unit_b, amount )
    when 'numeric'
      amount.to_f
    end
  end
end