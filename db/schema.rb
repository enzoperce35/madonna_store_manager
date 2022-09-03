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

ActiveRecord::Schema.define(version: 2022_09_03_075329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branch_inventories", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "inventory_item_id"
    t.float "margin"
    t.float "stock"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id", "inventory_item_id"], name: "index_branch_inventories_on_branch_id_and_inventory_item_id", unique: true
    t.index ["branch_id"], name: "index_branch_inventories_on_branch_id"
    t.index ["inventory_item_id"], name: "index_branch_inventories_on_inventory_item_id"
  end

  create_table "branch_products", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "product_id"
    t.string "category"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id", "product_id"], name: "index_branch_products_on_branch_id_and_product_id", unique: true
    t.index ["branch_id"], name: "index_branch_products_on_branch_id"
    t.index ["product_id"], name: "index_branch_products_on_product_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "branches_users", id: false, force: :cascade do |t|
    t.bigint "branch_id", null: false
    t.bigint "user_id", null: false
    t.index ["branch_id", "user_id"], name: "index_branches_users_on_branch_id_and_user_id", unique: true
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "name"
    t.string "item_type"
    t.string "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
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
  add_foreign_key "branch_products", "branches"
  add_foreign_key "branch_products", "products"
end
