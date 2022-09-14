class BranchPremadeItem < ApplicationRecord
  validates_presence_of :unit_count, on: [ :update ]

  belongs_to :branch, optional: true
  belongs_to :premade_item, optional: true
end
