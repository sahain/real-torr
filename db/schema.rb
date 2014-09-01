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

ActiveRecord::Schema.define(version: 20140901222011) do

  create_table "open_houses", force: true do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "open_houses", ["property_id"], name: "index_open_houses_on_property_id"

  create_table "properties", force: true do |t|
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "active"
    t.boolean  "featured"
    t.string   "image_file_name"
  end

  create_table "properties_open_houses", force: true do |t|
    t.integer  "properties_id"
    t.integer  "open_houses_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties_open_houses", ["open_houses_id"], name: "index_properties_open_houses_on_open_houses_id"
  add_index "properties_open_houses", ["properties_id"], name: "index_properties_open_houses_on_properties_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

end
