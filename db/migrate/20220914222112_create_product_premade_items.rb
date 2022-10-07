class CreateProductPremadeItems < ActiveRecord::Migration[6.1]
  def change
    create_table :product_premade_items do |t|
      t.string :unit
      t.float :unit_count
      t.belongs_to :product, null: true, foreign_key: true
      t.belongs_to :premade_item, null: true, foreign_key: true

      t.timestamps
    end
  end
end
