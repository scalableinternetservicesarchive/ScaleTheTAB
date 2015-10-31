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

ActiveRecord::Schema.define(version: 20151028073226) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "image_url",   limit: 255
    t.decimal  "price",                     precision: 8, scale: 2
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "menu_id",     limit: 4
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "item_id",    limit: 4
    t.integer  "cart_id",    limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "quantity",   limit: 4, default: 1
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["item_id"], name: "index_line_items_on_item_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.integer  "restaurant_id", limit: 4
    t.string   "title",         limit: 255
    t.text     "description",   limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "image_url",   limit: 255
    t.text     "description", limit: 65535
    t.string   "address",     limit: 255
    t.string   "city",        limit: 255
    t.integer  "zip_code",    limit: 4
    t.string   "tell",        limit: 255
    t.integer  "owner_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tables", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "restaurant_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "items"
end
