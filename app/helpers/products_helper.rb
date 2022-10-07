module ProductsHelper
  
  def item_of( join_model )
    case join_model.class.name
    when 'ProductInventoryItem'
      join_model.inventory_item
    when 'ProductPremadeItem'
      join_model.premade_item
    end
  end
end
