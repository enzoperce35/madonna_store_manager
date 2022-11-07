class BranchPremadeItem < ApplicationRecord
  validates_presence_of :stock, :margin, on: [ :update ]

  belongs_to :branch, optional: true
  belongs_to :premade_item, optional: true
end
