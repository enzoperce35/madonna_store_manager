class CreatePremadeItems < ActiveRecord::Migration[6.1]
  def change
    create_table :premade_items do |t|
      t.string :name
      t.string :item_type
      t.string :unit
      t.boolean :sale_deduction, default: false

      t.timestamps
    end
  end
end
