class AddIndexesToJoinTables < ActiveRecord::Migration[6.1]
 
  # avoid entry duplicates for these join tables
  def change
    add_index :branch_products, [ :branch_id, :product_id ], unique: true
    add_index :branch_inventories, [ :branch_id, :inventory_item_id ], unique: true
    add_index :branch_premade_items, [ :branch_id, :premade_item_id ], unique: true
    add_index :product_inventory_items, [ :product_id, :inventory_item_id ], unique: true, name: 'product_inventory'
    add_index :product_premade_items, [ :product_id, :premade_item_id ], unique: true
    add_index :premade_inventory_items, [ :premade_item_id, :inventory_item_id ], unique: true, name: 'premade_inventory'
  end
end
