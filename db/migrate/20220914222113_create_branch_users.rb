class CreateBranchUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :branch_users do |t|
      t.belongs_to  :branch, null: true, foreign_key: true
      t.belongs_to  :user, null: true, foreign_key: true
      
      t.timestamps
    end
  end
end
