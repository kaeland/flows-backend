# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_11_174030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.bigint "plant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["addressable_id", "addressable_type"], name: "index_addresses_on_addressable_id_and_addressable_type"
    t.index ["plant_id"], name: "index_addresses_on_plant_id"
  end

  create_table "machine_rounds", force: :cascade do |t|
    t.bigint "machine_id"
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "data"
    t.bigint "shift_id"
    t.index ["machine_id"], name: "index_machine_rounds_on_machine_id"
    t.index ["round_id"], name: "index_machine_rounds_on_round_id"
    t.index ["shift_id"], name: "index_machine_rounds_on_shift_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.bigint "plant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["plant_id"], name: "index_machines_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: :cascade do |t|
    t.string "time_of_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifts", force: :cascade do |t|
    t.string "name"
    t.bigint "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["round_id"], name: "index_shifts_on_round_id"
  end

  create_table "user_shifts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shift_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_user_shifts_on_shift_id"
    t.index ["user_id"], name: "index_user_shifts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.text "bio"
    t.string "avatar"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "plant_id"
    t.index ["manager_id"], name: "index_users_on_manager_id"
    t.index ["plant_id"], name: "index_users_on_plant_id"
  end

  add_foreign_key "addresses", "plants"
  add_foreign_key "machine_rounds", "machines"
  add_foreign_key "machine_rounds", "rounds"
  add_foreign_key "machine_rounds", "shifts"
  add_foreign_key "machines", "plants"
  add_foreign_key "shifts", "rounds"
  add_foreign_key "user_shifts", "shifts"
  add_foreign_key "user_shifts", "users"
  add_foreign_key "users", "plants"
end
