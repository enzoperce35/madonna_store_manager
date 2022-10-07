class Product < ApplicationRecord
  validates_presence_of :name, :price, on: [ :create, :update ]
  validates_uniqueness_of :name, on: [ :create, :update ]
  
  has_many :branch_products, dependent: :destroy
  has_many :branches, through: :branch_products

  has_many :product_inventory_items, dependent: :destroy
  has_many :inventory_items, through: :product_inventory_items
  
  has_many :product_premade_items, dependent: :destroy
  has_many :premade_items, through: :product_premade_items

  before_validation do | product |
    product.name = product.name.downcase.capitalize
  end
end
