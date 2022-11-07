class InventoryItem < ApplicationRecord
  validates_presence_of :name, :item_type, :item_quantity, :unit, :market_price, on: [ :create, :update ]
  validates_uniqueness_of :name, on: [ :create, :update ]
  
  has_many :branch_inventories, dependent: :destroy
  has_many :branches, through: :branch_inventories

  has_many :product_inventory_items, dependent: :destroy
  has_many :products, through: :product_inventory_items

  has_many :premade_inventory_items, dependent: :destroy
  has_many :premade_items, through: :premade_inventory_items

  has_many :inventory_item_transfers
  has_many :transfers, through: :inventory_item_transfers, dependent: :destroy

  before_validation do | item |
    item.name = item.name.downcase.capitalize
    item.item_type = item.item_type.singularize.downcase.capitalize
    item.unit = item.unit.downcase.singularize
  end
end
