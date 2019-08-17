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

ActiveRecord::Schema.define(version: 2019_06_01_090902) do

  create_table "boards", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviews", force: :cascade do |t|
    t.integer "age", null: false
    t.string "sex", null: false
    t.string "career", null: false
    t.string "use_service", null: false
    t.string "existing_service_uncomfortable", null: false
    t.integer "subscribe_channel_number", null: false
    t.string "like_category", null: false
    t.text "good_point", null: false
    t.text "bad_point", null: false
    t.integer "recommendation", null: false
    t.text "cause", null: false
    t.string "screenshot", null: false
    t.string "favorite_site", null: false
    t.string "period", null: false
    t.string "highlight_video", null: false
    t.string "what_highlight_video", null: false
    t.string "how_long_watch", null: false
    t.string "when_watch", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "gift", null: false
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

  create_table "surveys", force: :cascade do |t|
    t.integer "age"
    t.string "sex"
    t.string "career"
    t.string "use_service"
    t.string "existing_service_uncomfortable"
    t.integer "subscribe_channel_number"
    t.string "like_category"
    t.text "good_point"
    t.text "bad_point"
    t.integer "recommendation"
    t.text "cause"
    t.string "screenshot"
    t.string "favorite_site"
    t.string "period"
    t.string "highlight_video"
    t.string "what_highlight_video"
    t.string "how_long_watch"
    t.string "when_watch"
    t.string "email"
    t.string "phone_number"
    t.string "gift"
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
