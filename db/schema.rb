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

ActiveRecord::Schema.define(version: 2018_06_17_122517) do

  create_table "mises", force: :cascade do |t|
    t.text "mise_info"
    t.text "ozone_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
