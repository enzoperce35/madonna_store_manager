class CreateInventoryItemTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_item_transfers do |t|
      t.float       :quantity
      t.belongs_to  :transfer, null: true, foreign_key: true
      t.belongs_to  :inventory_item, null: true, foreign_key: true

      t.timestamps
    end
  end
end
