class CreateBranchInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :branch_inventories do |t|
      t.float       :stock, default: 0
      t.belongs_to  :branch, null: true, foreign_key: true
      t.belongs_to  :inventory_item, null: true, foreign_key: true
      
      t.timestamps
    end
  end
end
