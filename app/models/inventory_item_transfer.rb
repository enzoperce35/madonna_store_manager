class InventoryItemTransfer < ApplicationRecord
  belongs_to :transfer, optional: true
  belongs_to :inventory_item, optional: true
end
