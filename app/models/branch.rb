class Branch < ApplicationRecord
  has_and_belongs_to_many :users
  
  has_many :branch_products, dependent: :destroy
  has_many :products, through: :branch_products
end
