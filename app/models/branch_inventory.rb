class BranchInventory < ApplicationRecord
  validates_presence_of :inventory_stock, on: [ :update ]
  
  belongs_to :branch, optional: true
  belongs_to :inventory_item, optional: true
end
