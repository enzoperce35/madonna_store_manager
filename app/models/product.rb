class Product < ApplicationRecord
  validates_presence_of :name, on: [ :create, :update ]
  validates_uniqueness_of :name, on: [ :create, :update ]
  
  has_many :branch_products, dependent: :destroy
  has_many :branches, through: :branch_products

  before_validation do | product |
    product.name = product.name.downcase.capitalize
  end
end
