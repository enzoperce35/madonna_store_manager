class AddIndexesToJoinTables < ActiveRecord::Migration[6.1]
 
  # avoid entry duplicates for these join tables
  def change
    add_index :branches_users, [ :branch_id, :user_id ], unique: true
    add_index :branch_products, [ :branch_id, :product_id ], unique: true
    add_index :branch_inventories, [ :branch_id, :inventory_item_id ], unique: true
  end
end
