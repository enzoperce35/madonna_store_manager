class BranchProduct < ApplicationRecord
  validates_presence_of :price, :category, on: [ :update ]
  
  belongs_to :branch, optional: true
  belongs_to :product, optional: true
end
