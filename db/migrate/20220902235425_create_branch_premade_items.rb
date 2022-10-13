class CreateBranchPremadeItems < ActiveRecord::Migration[6.1]
  def change
    create_table :branch_premade_items do |t|
      t.float       :stock, default: 0
      t.float       :margin, default: 0
      t.belongs_to  :branch, null: true, foreign_key: true
      t.belongs_to  :premade_item, null: true, foreign_key: true

      t.timestamps
    end
  end
end
