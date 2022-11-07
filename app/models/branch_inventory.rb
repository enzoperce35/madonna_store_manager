class BranchInventory < ApplicationRecord
  validates_presence_of :stock, :margin, on: [ :update ]
  
  belongs_to :branch, optional: true
  belongs_to :inventory_item, optional: true
end
