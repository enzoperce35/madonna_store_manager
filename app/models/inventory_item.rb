class InventoryItem < ApplicationRecord
  validates_presence_of :name, on: [ :create, :update ]
  validates_uniqueness_of :name, on: [ :create, :update ]
  
  has_many :branch_inventories, dependent: :destroy
  has_many :branches, through: :branch_inventories

  before_validation do | item |
    item.name = item.name.downcase.capitalize
    item.item_type = item.item_type.singularize.downcase.capitalize
    item.unit = item.unit.downcase.singularize
  end
end
