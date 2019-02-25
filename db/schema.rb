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

ActiveRecord::Schema.define(version: 2019_02_25_075924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyer_profiles", force: :cascade do |t|
    t.integer "size"
    t.string "style"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_buyer_profiles_on_user_id"
  end

  create_table "dressmaker_profiles", force: :cascade do |t|
    t.string "bio"
    t.string "account_status"
    t.string "insta_url"
    t.string "fb_url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dressmaker_profiles_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "dressmaker_profile_id"
    t.bigint "buyer_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_profile_id"], name: "index_favourites_on_buyer_profile_id"
    t.index ["dressmaker_profile_id"], name: "index_favourites_on_dressmaker_profile_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_messages_on_order_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "cost"
    t.date "completion_date"
    t.integer "quantity"
    t.string "order_details"
    t.string "status"
    t.jsonb "payment"
    t.bigint "user_id"
    t.bigint "dressmaker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "dimension_chest"
    t.float "dimension_waist"
    t.float "dimension_hips"
    t.float "dimension_length"
    t.string "colour"
    t.string "fabric"
    t.index ["dressmaker_id"], name: "index_orders_on_dressmaker_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url"
    t.bigint "dressmaker_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dressmaker_profile_id"], name: "index_photos_on_dressmaker_profile_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_reviews_on_order_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_specialities", force: :cascade do |t|
    t.bigint "dressmaker_profile_id"
    t.bigint "speciality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dressmaker_profile_id"], name: "index_user_specialities_on_dressmaker_profile_id"
    t.index ["speciality_id"], name: "index_user_specialities_on_speciality_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "dressmaker"
    t.string "street_address"
    t.string "street_address_2"
    t.string "country"
    t.string "post_code"
    t.string "avatar_url"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buyer_profiles", "users"
  add_foreign_key "dressmaker_profiles", "users"
  add_foreign_key "favourites", "buyer_profiles"
  add_foreign_key "favourites", "dressmaker_profiles"
  add_foreign_key "messages", "orders"
  add_foreign_key "messages", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "users", column: "dressmaker_id"
  add_foreign_key "photos", "dressmaker_profiles"
  add_foreign_key "reviews", "orders"
  add_foreign_key "user_specialities", "dressmaker_profiles"
  add_foreign_key "user_specialities", "specialities"
end
