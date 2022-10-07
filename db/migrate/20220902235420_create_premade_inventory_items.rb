class CreatePremadeInventoryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :premade_inventory_items do |t|
      t.string :unit
      t.float :unit_count
      t.belongs_to :premade_item, null: true, foreign_key: true
      t.belongs_to :inventory_item, null: true, foreign_key: true

      t.timestamps
    end
  end
end
