module HomeHelper
  def background_color_for( unit_value )
    color = 
    case unit_value[ 'class' ]
    when 'volume'
      'blue;' 
    when 'weight'
      'yellow;'
    when 'length'
      'red;'
    else
      'green;'
    end

    'font-style:' + 'italic;' + 'font-weight:' + 'bold;' + 'background-color:'  + color
  end
end
