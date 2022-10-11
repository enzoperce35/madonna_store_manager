class PremadeItem < ApplicationRecord
  validates_presence_of :name, :unit, :item_type, :item_quantity, on: [ :create, :update ]
  validates_uniqueness_of :name, on: [ :create, :update ]
  
  has_many :branch_premade_items, dependent: :destroy
  has_many :branches, through: :branch_premade_items
  
  has_many :premade_inventory_items, dependent: :destroy
  has_many :inventory_items, through: :premade_inventory_items
  
  has_many :product_premade_items, dependent: :destroy
  has_many :products, through: :product_premade_items

  before_validation do | item |
    item.name = item.name.downcase.capitalize
    item.unit = item.unit.downcase.singularize
  end
end
