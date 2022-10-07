class CreatePremadeItems < ActiveRecord::Migration[6.1]
  def change
    create_table :premade_items do |t|
      t.string   :name
      t.string   :unit
      t.float    :item_quantity
      t.float    :stock
      t.boolean  :vouched, default: false

      t.timestamps
    end
  end
end
