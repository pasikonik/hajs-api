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

ActiveRecord::Schema.define(version: 2019_01_04_144519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.bigint "payment_id"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_bills_on_payment_id"
    t.index ["place_id"], name: "index_bills_on_place_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "type"
    t.string "status"
    t.integer "amount"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bill_id"
    t.bigint "place_id"
    t.index ["bill_id"], name: "index_payments_on_bill_id"
    t.index ["place_id"], name: "index_payments_on_place_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.integer "rent"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "password_digest", limit: 128, null: false
    t.integer "place_id"
    t.string "username"
    t.string "encrypted_ban"
    t.string "encrypted_ban_iv"
    t.integer "max_pay"
    t.boolean "payer"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "bills", "payments"
  add_foreign_key "bills", "places"
  add_foreign_key "payments", "bills"
  add_foreign_key "payments", "places"
  add_foreign_key "payments", "users"
  add_foreign_key "places", "users"
end
