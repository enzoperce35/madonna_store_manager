# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_10_051800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branch_inventories", force: :cascade do |t|
    t.float "stock", default: 0.0
    t.bigint "branch_id"
    t.bigint "inventory_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id", "inventory_item_id"], name: "index_branch_inventories_on_branch_id_and_inventory_item_id", unique: true
    t.index ["branch_id"], name: "index_branch_inventories_on_branch_id"
    t.index ["inventory_item_id"], name: "index_branch_inventories_on_inventory_item_id"
  end

  create_table "branch_premade_items", force: :cascade do |t|
    t.float "stock", default: 0.0
    t.bigint "branch_id"
    t.bigint "premade_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id", "premade_item_id"], name: "index_branch_premade_items_on_branch_id_and_premade_item_id", unique: true
    t.index ["branch_id"], name: "index_branch_premade_items_on_branch_id"
    t.index ["premade_item_id"], name: "index_branch_premade_items_on_premade_item_id"
  end

  create_table "branch_products", force: :cascade do |t|
    t.string "category"
    t.float "price"
    t.bigint "branch_id"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id", "product_id"], name: "index_branch_products_on_branch_id_and_product_id", unique: true
    t.index ["branch_id"], name: "index_branch_products_on_branch_id"
    t.index ["product_id"], name: "index_branch_products_on_product_id"
  end

  create_table "branch_users", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_branch_users_on_branch_id"
    t.index ["user_id"], name: "index_branch_users_on_user_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "name"
    t.string "item_type"
    t.float "item_quantity"
    t.string "unit"
    t.text "unit_note"
    t.float "market_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "premade_inventory_items", force: :cascade do |t|
    t.string "unit"
    t.float "unit_count"
    t.bigint "premade_item_id"
    t.bigint "inventory_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inventory_item_id"], name: "index_premade_inventory_items_on_inventory_item_id"
    t.index ["premade_item_id", "inventory_item_id"], name: "premade_inventory", unique: true
    t.index ["premade_item_id"], name: "index_premade_inventory_items_on_premade_item_id"
  end

  create_table "premade_items", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.string "item_type"
    t.float "item_quantity"
    t.boolean "vouched", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_inventory_items", force: :cascade do |t|
    t.string "unit"
    t.float "unit_count"
    t.bigint "product_id"
    t.bigint "inventory_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inventory_item_id"], name: "index_product_inventory_items_on_inventory_item_id"
    t.index ["product_id", "inventory_item_id"], name: "product_inventory", unique: true
    t.index ["product_id"], name: "index_product_inventory_items_on_product_id"
  end

  create_table "product_premade_items", force: :cascade do |t|
    t.string "unit"
    t.float "unit_count"
    t.bigint "product_id"
    t.bigint "premade_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["premade_item_id"], name: "index_product_premade_items_on_premade_item_id"
    t.index ["product_id", "premade_item_id"], name: "index_product_premade_items_on_product_id_and_premade_item_id", unique: true
    t.index ["product_id"], name: "index_product_premade_items_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.float "min_net"
    t.boolean "add_on", default: false
    t.boolean "vouched", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "branch_inventories", "branches"
  add_foreign_key "branch_inventories", "inventory_items"
  add_foreign_key "branch_premade_items", "branches"
  add_foreign_key "branch_premade_items", "premade_items"
  add_foreign_key "branch_products", "branches"
  add_foreign_key "branch_products", "products"
  add_foreign_key "branch_users", "branches"
  add_foreign_key "branch_users", "users"
  add_foreign_key "premade_inventory_items", "inventory_items"
  add_foreign_key "premade_inventory_items", "premade_items"
  add_foreign_key "product_inventory_items", "inventory_items"
  add_foreign_key "product_inventory_items", "products"
  add_foreign_key "product_premade_items", "premade_items"
  add_foreign_key "product_premade_items", "products"
end
