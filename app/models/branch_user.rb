class BranchUser < ApplicationRecord
  belongs_to :branch, optional: true
  belongs_to :user, optional: true
end
