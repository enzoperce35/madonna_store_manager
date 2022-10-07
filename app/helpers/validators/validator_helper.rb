module Validators::ValidatorHelper
  include Validators::Product
  include Validators::PremadeItem
  include Validators::ProductInventoryItem
  include Validators::PremadeInventoryItem
  include Validators::ProductPremadeItem

  def null_data_is_detected_from?( model_joins )
    model_joins.where( unit_count: nil ).count > 0
  end
  
  def verified?( model )
    model.vouched
  end

  def verified_and_complete?( model )
    case model.class.name
    when 'PremadeItem'
      verified?( model ) && complete_premade_item_data_values?( model )
    when 'Product'
      verified?( model ) && complete_product_data_values?( model )
    when 'ProductInventoryItem'
      complete_product_inventory_item_data_values?( model )
    when 'ProductPremadeItem'
      complete_product_premade_item_data_values?( model )
    when 'PremadeInventoryItem'
      complete_premade_inventory_item_data_values?( model )
    end
  end
end
