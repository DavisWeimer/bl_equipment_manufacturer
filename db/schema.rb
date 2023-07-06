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

ActiveRecord::Schema[7.0].define(version: 2023_07_06_001120) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "headquarters"
    t.boolean "elemental?"
    t.integer "num_of_games_appeared_in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "weapon_id"
    t.index ["weapon_id"], name: "index_manufacturers_on_weapon_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.integer "level_req"
    t.string "rarity"
    t.string "type"
    t.string "name"
    t.integer "damage"
    t.float "accuracy"
    t.float "fire_rate"
    t.float "reload_speed"
    t.integer "magazine_size"
    t.boolean "elemental?"
    t.string "elemental_type"
    t.string "trait"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "manufacturer_id"
    t.index ["manufacturer_id"], name: "index_weapons_on_manufacturer_id"
  end

  add_foreign_key "manufacturers", "weapons"
  add_foreign_key "weapons", "manufacturers"
end
