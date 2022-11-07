class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers do |t|
      t.boolean     :recieved, default: false
      t.text        :note
      t.integer     :sender, null: true, foreign_key: true
      t.integer     :recipient, null: true, foreign_key: true
      
      t.timestamps
    end
  end
end
