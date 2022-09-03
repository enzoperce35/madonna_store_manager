class CreateBranchInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :branch_inventories do |t|
      t.belongs_to :branch, null: true, foreign_key: true
      t.belongs_to :inventory_item, null: true, foreign_key: true
      t.float :margin
      t.float :stock
      
      t.timestamps
    end
  end
end
