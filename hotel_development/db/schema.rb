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

ActiveRecord::Schema[7.0].define(version: 2022_11_14_214109) do
  create_table "food_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "food_type_img"
  end

  create_table "foods", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_type_id"
    t.string "food_img"
    t.index ["food_type_id"], name: "index_foods_on_food_type_id"
  end

  create_table "reservations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "room_id"
    t.integer "num_of_ppl", null: false
    t.index ["room_id"], name: "index_reservations_on_room_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "comment", size: :long, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "rating"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "room_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "max_capacity", null: false
    t.string "room_type_img", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "room_num", null: false
    t.string "status", limit: 1, default: "0", null: false
    t.string "room_img", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_type_id"
    t.bigint "reservation_id"
    t.string "size", null: false
    t.string "service1"
    t.string "service2"
    t.string "service3"
    t.index ["reservation_id"], name: "index_rooms_on_reservation_id"
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
  end

  create_table "tokens", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "password_reset_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "reset_password_sent_at"
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.string "profile", null: false
    t.string "user_type", limit: 1, default: "1", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_confirmation"
    t.string "remember_token"
  end

  add_foreign_key "foods", "food_types"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "rooms", "reservations"
  add_foreign_key "rooms", "room_types"
  add_foreign_key "tokens", "users"
end
