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

ActiveRecord::Schema.define(version: 20171015222134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "redactor_images", force: :cascade do |t|
    t.string "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "login"
    t.string "password"
    t.string "email"
    t.string "phone"
    t.string "country_code"
    t.datetime "blocked_at"
    t.integer "failed_attempt_count"
    t.integer "role"
    t.datetime "activated_at"
    t.datetime "last_login_at"
    t.string "last_login_ip"
    t.string "reset_password_token"
    t.datetime "reset_passwrd_sent_at"
    t.integer "sign_in_count"
    t.string "current_sign_in_ip"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "writings", force: :cascade do |t|
    t.string "name"
    t.text "annotation"
    t.boolean "active", default: false, null: false
    t.date "published_date"
    t.string "slug"
    t.text "body"
    t.string "type"
    t.text "preview_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
