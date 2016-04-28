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

ActiveRecord::Schema.define(version: 20160425215422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "description",     limit: 255
    t.integer  "sub_category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "items", ["sub_category_id"], name: "index_items_on_sub_category_id", using: :btree

  create_table "stocks", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "warehouse_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "stocks", ["item_id"], name: "index_stocks_on_item_id", using: :btree
  add_index "stocks", ["warehouse_id"], name: "index_stocks_on_warehouse_id", using: :btree

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "warehouses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "items", "sub_categories"
  add_foreign_key "stocks", "items"
  add_foreign_key "stocks", "warehouses"
  add_foreign_key "sub_categories", "categories"
end
