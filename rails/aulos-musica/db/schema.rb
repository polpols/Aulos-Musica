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

ActiveRecord::Schema.define(version: 20150418121758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "composership", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "product_id"
  end

  add_index "composership", ["contact_id"], name: "index_composership_on_contact_id", using: :btree
  add_index "composership", ["product_id"], name: "index_composership_on_product_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "type"
    t.string   "company"
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["type"], name: "index_contacts_on_type", using: :btree

  create_table "instrumentation", id: false, force: :cascade do |t|
    t.integer "product_id",    null: false
    t.integer "instrument_id", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "instruments", ["abbr"], name: "index_instruments_on_abbr", using: :btree
  add_index "instruments", ["name"], name: "index_instruments_on_name", using: :btree

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "tags",        array: true
  end

  add_index "lists", ["tags"], name: "index_lists_on_tags", using: :gin

  create_table "lists_products", force: :cascade do |t|
    t.integer "list_id"
    t.integer "product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "author"
    t.string "composer"
    t.string "description"
    t.string "info"
    t.string "instrument"
    t.string "isbn"
    t.string "manufacturer"
    t.string "type"
  end

end
