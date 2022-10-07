module Phrases::PhraseHelper
  include Phrases::PremadeItemCapacity

  def edit_product_unit_label_phrase_for( join, product_item )
    starting_phrase = product_item.unit == 'piece' ? 'How many ' : 'How much  '

    product = join.product

    "#{ starting_phrase } '
     #{ product_item.name } ' for
     #{ product.name }?"
  end
  
  def premade_inventory_item_unit_label_phrase_for( premade_inventory_item )
    starting_phrase = premade_inventory_item.inventory_item.unit == 'piece' ? 'How many ' : 'How much  '

    premade_item = premade_inventory_item.premade_item

    "#{ starting_phrase } '
     #{ premade_inventory_item.inventory_item.name } ' for
     #{ unit_quantity_of( premade_item ) }
     #{ premade_item.name }?"
  end
end
