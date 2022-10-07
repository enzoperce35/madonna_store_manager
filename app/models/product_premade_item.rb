class ProductPremadeItem < ApplicationRecord
  validates_presence_of :unit_count, :unit, on: [ :update ]
  
  belongs_to :product, optional: true
  belongs_to :premade_item, optional: true
end
