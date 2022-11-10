class CreatePremadeItemTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :premade_item_transfers do |t|
      t.float       :quantity
      t.belongs_to  :transfer, null: true, foreign_key: true
      t.belongs_to  :premade_item, null: true, foreign_key: true
      
      t.timestamps
    end
  end
end
