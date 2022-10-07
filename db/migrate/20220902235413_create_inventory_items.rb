class CreateInventoryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_items do |t|
      t.string   :name
      t.string   :item_type
      t.float    :item_quantity
      t.string   :unit
      t.text     :unit_note
      t.float    :market_price
      t.float    :stock
      
      t.timestamps
    end
  end
end
