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

ActiveRecord::Schema.define(version: 2019_05_07_112749) do

  create_table "boards", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mises", force: :cascade do |t|
    t.text "mise_info"
    t.text "ozone_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "openweathers", force: :cascade do |t|
    t.integer "region_id"
    t.string "temp"
    t.string "weather"
    t.string "description"
    t.string "icon"
    t.string "dt_txt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "city1"
    t.string "city2"
    t.float "lon"
    t.float "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "etc"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_key"
    t.string "region"
    t.integer "regist_check"
    t.string "phone"
    t.string "add_check"
    t.string "etc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "alarm_time"
    t.integer "region_id"
  end

  create_table "weathers", force: :cascade do |t|
    t.string "city"
    t.string "region_name"
    t.string "x_value"
    t.string "y_value"
    t.string "check_value"
    t.text "w_time"
    t.text "w_temp"
    t.text "w_weather"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
