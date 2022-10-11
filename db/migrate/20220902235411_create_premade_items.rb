class CreatePremadeItems < ActiveRecord::Migration[6.1]
  def change
    create_table :premade_items do |t|
      t.string   :name
      t.string   :unit
      t.string   :item_type
      t.float    :item_quantity
      t.boolean  :vouched, default: false

      t.timestamps
    end
  end
end
