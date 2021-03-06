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

ActiveRecord::Schema.define(version: 20160712193731) do

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "marked_private"
    t.string   "fabric_type"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.decimal  "price"
    t.integer  "quantity"
    t.string   "design_name"
    t.integer  "design_id"
    t.integer  "spoonflower_id"
    t.string   "thumbnail_url"
    t.string   "fabric_type"
    t.boolean  "purchased"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "receipt_id"
    t.string   "color"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "receipt_id"
    t.boolean  "purchased"
  end

  create_table "designs", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "spoonflower_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.integer  "cart_item_id"
    t.string   "city"
    t.string   "adr_1"
    t.string   "adr_2"
    t.string   "state"
    t.integer  "zip"
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "last_4"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "design_id"
    t.string   "username"
    t.string   "note"
    t.integer  "stars"
    t.integer  "size"
    t.integer  "comfort"
    t.integer  "performance"
    t.string   "gender"
    t.string   "boolean"
    t.string   "sport"
    t.integer  "age"
    t.string   "size_purchased"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "search_results", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shippings", force: :cascade do |t|
    t.string   "name"
    t.string   "adr_1"
    t.string   "adr_2"
    t.string   "state"
    t.integer  "zip"
    t.integer  "total"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "provider"
    t.string   "uid"
  end

end
