class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string   :name
      t.float    :price
      t.float    :min_net
      t.boolean  :vouched, default: false

      t.timestamps
    end
  end
end
