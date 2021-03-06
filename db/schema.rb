# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160711065816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.string   "name"
    t.integer  "travel_city_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "days", ["travel_city_id"], name: "index_days_on_travel_city_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image_uid"
    t.string   "image_name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "place"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "day_id"
  end

  add_index "places", ["day_id"], name: "index_places_on_day_id", using: :btree

  create_table "storage_chunks", force: :cascade do |t|
    t.integer "file_id"
    t.integer "idx"
    t.binary  "encoded_data"
  end

  add_index "storage_chunks", ["file_id"], name: "index_storage_chunks_on_file_id", using: :hash

  create_table "storage_files", force: :cascade do |t|
    t.text     "metadata"
    t.datetime "accessed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travel_cities", force: :cascade do |t|
    t.string   "from_city"
    t.string   "to_city"
    t.datetime "started_on"
    t.datetime "reache_on"
    t.integer  "how_id"
    t.integer  "trip_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "from_lng"
    t.string   "from_lat"
    t.string   "from_address"
    t.string   "to_lng"
    t.string   "to_lat"
    t.string   "to_address"
  end

  add_index "travel_cities", ["trip_id"], name: "index_travel_cities_on_trip_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "days", "travel_cities"
  add_foreign_key "travel_cities", "trips"
end
