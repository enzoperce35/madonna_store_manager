class PremadeItemTransfer < ApplicationRecord
  belongs_to :transfer, optional: true
  belongs_to :premade_item, optional: true
end
