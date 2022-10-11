class Branch < ApplicationRecord
  has_many :branch_products, dependent: :destroy
  has_many :products, through: :branch_products

  has_many :branch_inventories, dependent: :destroy
  has_many :inventory_items, through: :branch_inventories

  has_many :branch_premade_items, dependent: :destroy
  has_many :premade_items, through: :branch_premade_items
  
  has_many :branch_users, dependent: :destroy
  has_many :users, through: :branch_users
end
