class ProductInventoryItem < ApplicationRecord
  validates_presence_of :unit_count, :unit, on: [ :update ]
  
  belongs_to :product, optional: true
  belongs_to :inventory_item, optional: true
end
