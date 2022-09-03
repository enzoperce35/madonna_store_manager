class InventoryItem < ApplicationRecord
  validates :name, uniqueness: true
  
  has_many :branch_inventories, dependent: :destroy
  has_many :branches, through: :branch_inventories
end
