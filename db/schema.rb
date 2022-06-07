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

ActiveRecord::Schema.define(version: 2022_06_06_082912) do

  create_table "locations", force: :cascade do |t|
    t.string "municipality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "packages", force: :cascade do |t|
    t.integer "price_cents", default: 0, null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_packages_on_name", unique: true
  end

  create_table "price_logs", force: :cascade do |t|
    t.integer "price_cents", null: false
    t.integer "default_price_cents"
    t.integer "package_id", null: false
    t.integer "location_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_price_logs_on_location_id"
    t.index ["package_id"], name: "index_price_logs_on_package_id"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "price_cents", null: false
    t.integer "package_id", null: false
    t.integer "location_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_prices_on_location_id"
    t.index ["package_id"], name: "index_prices_on_package_id"
  end

  add_foreign_key "price_logs", "locations"
  add_foreign_key "price_logs", "packages"
  add_foreign_key "prices", "locations"
  add_foreign_key "prices", "packages"
end
