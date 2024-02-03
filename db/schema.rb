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

ActiveRecord::Schema[7.1].define(version: 2024_02_01_122655) do
  create_table "branch_items", force: :cascade do |t|
    t.integer "branch_id"
    t.integer "item_id"
    t.decimal "price"
    t.integer "available_qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.boolean "is_cooked"
    t.decimal "preparationـtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "active", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "item_id"
    t.decimal "price"
    t.integer "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "branch_id"
    t.string "username"
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "active", null: false
  end

end
