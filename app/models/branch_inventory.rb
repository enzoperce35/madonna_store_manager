class BranchInventory < ApplicationRecord
  belongs_to :branch, optional: true
  belongs_to :inventory_item, optional: true
end
