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

ActiveRecord::Schema.define(version: 20140615081215) do

  create_table "navbar_items", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "website_id"
  end

  add_index "navbar_items", ["user_id"], name: "index_navbar_items_on_user_id"
  add_index "navbar_items", ["website_id"], name: "index_navbar_items_on_website_id"

  create_table "pages", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "navbar_item_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.integer  "website_id"
    t.string   "video_code"
  end

  add_index "pages", ["navbar_item_id"], name: "index_pages_on_navbar_item_id"
  add_index "pages", ["user_id"], name: "index_pages_on_user_id"
  add_index "pages", ["website_id"], name: "index_pages_on_website_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "websites", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "home_title"
    t.text     "home_body"
    t.string   "home_cover_file_name"
    t.string   "home_cover_content_type"
    t.integer  "home_cover_file_size"
    t.datetime "home_cover_updated_at"
    t.string   "navbar_color",            default: "#F8F8F8"
    t.string   "navbar_text_color"
    t.string   "jumbotron_text_color"
    t.string   "slug"
  end

  add_index "websites", ["user_id"], name: "index_websites_on_user_id"

end
