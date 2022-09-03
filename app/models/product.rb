class Product < ApplicationRecord
  validates :name, uniqueness: true
  
  has_many :branch_products, dependent: :destroy
  has_many :branches, through: :branch_products
end
