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

ActiveRecord::Schema.define(version: 2018_08_06_150452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.text "start_date"
    t.text "end_date"
    t.bigint "user_id"
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["venue_id"], name: "index_bookings_on_venue_id"
  end

  create_table "categories", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "email"
    t.text "phone_number"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.text "name"
    t.text "address"
    t.text "email"
    t.text "description"
    t.integer "price"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["category_id"], name: "index_venues_on_category_id"
    t.index ["user_id"], name: "index_venues_on_user_id"
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "venues"
  add_foreign_key "venues", "categories"
  add_foreign_key "venues", "users"
end
