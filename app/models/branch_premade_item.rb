class BranchPremadeItem < ApplicationRecord
  belongs_to :branch, optional: true
  belongs_to :premade_item, optional: true
end
