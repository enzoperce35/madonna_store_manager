class PremadeInventoryItem < ApplicationRecord
  validates_presence_of :unit, :unit_count, on: [ :update ]

  belongs_to :premade_item, optional: true
  belongs_to :inventory_item, optional: true
end
