# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_26_083750) do

  create_table "daily_productions", force: :cascade do |t|
    t.date "date"
    t.integer "energy_production"
  end

  create_table "daily_productions_inverters", id: false, force: :cascade do |t|
    t.integer "daily_production_id", null: false
    t.integer "inverter_id", null: false
    t.index ["daily_production_id", "inverter_id"], name: "index_daily_productions_inverters"
    t.index ["inverter_id", "daily_production_id"], name: "index_daily_inverters_productions"
  end

  create_table "hourly_productions", force: :cascade do |t|
    t.datetime "datetime"
    t.integer "energy_production"
    t.integer "daily_production_id", null: false
    t.integer "inverter_id", null: false
    t.index ["daily_production_id"], name: "index_hourly_productions_on_daily_production_id"
    t.index ["inverter_id"], name: "index_hourly_productions_on_inverter_id"
  end

  create_table "inverters", force: :cascade do |t|
  end

  add_foreign_key "hourly_productions", "daily_productions"
  add_foreign_key "hourly_productions", "inverters"
end
