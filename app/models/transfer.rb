class Transfer < ApplicationRecord
  has_many :inventory_item_transfers
  has_many :inventory_items, through: :inventory_item_transfers, dependent: :destroy

  has_many :premade_item_transfers
  has_many :premade_items, through: :premade_item_transfers, dependent: :destroy
  
  accepts_nested_attributes_for :inventory_item_transfers, allow_destroy: true, reject_if: proc { |att| att[ 'inventory_item_id' ].blank? || att[ 'quantity' ].blank?  }

  accepts_nested_attributes_for :premade_item_transfers, allow_destroy: true, reject_if: proc { |att| att[ 'premade_item_id' ].blank? || att[ 'quantity' ].blank?  }
end
