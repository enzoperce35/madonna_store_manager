class CreateBranchProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :branch_products do |t|
      t.belongs_to :branch, null: true, foreign_key: true
      t.belongs_to :product, null: true, foreign_key: true
      t.string :category
      t.float :price

      t.timestamps
    end
  end
end
