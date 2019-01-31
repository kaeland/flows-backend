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

ActiveRecord::Schema.define(version: 2019_01_31_154030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.bigint "plant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["plant_id"], name: "index_addresses_on_plant_id"
  end

  create_table "data", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.decimal "payload"
    t.bigint "machine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["machine_id"], name: "index_data_on_machine_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.bigint "plant_id"
    t.bigint "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["plant_id"], name: "index_machines_on_plant_id"
    t.index ["round_id"], name: "index_machines_on_round_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: :cascade do |t|
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["round_id"], name: "index_shifts_on_round_id"
    t.index ["user_id"], name: "index_shifts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "bio"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "plant_id"
    t.index ["plant_id"], name: "index_users_on_plant_id"
  end

  add_foreign_key "addresses", "plants"
  add_foreign_key "data", "machines"
  add_foreign_key "machines", "plants"
  add_foreign_key "machines", "rounds"
  add_foreign_key "shifts", "rounds"
  add_foreign_key "shifts", "users"
  add_foreign_key "users", "plants"
end
