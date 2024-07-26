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

ActiveRecord::Schema[7.1].define(version: 2024_07_14_103433) do
  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "booking_type"
    t.datetime "booking_datetime", null: false
    t.datetime "start_datetime", null: false
    t.datetime "end_datetime"
    t.string "status", default: "pending"
    t.decimal "total_price", precision: 10, scale: 2, null: false
    t.string "payment_status", default: "unpaid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_name"
    t.string "flight_type"
    t.string "start", null: false
    t.string "destination", null: false
    t.time "departure_time"
    t.decimal "total_price", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination"], name: "index_flights_on_destination"
    t.index ["start"], name: "index_flights_on_start"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.integer "rating"
    t.integer "available_rooms", default: 0
    t.decimal "price_per_night", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location"], name: "index_hotels_on_location"
    t.index ["rating"], name: "index_hotels_on_rating"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookings", "users"
end
