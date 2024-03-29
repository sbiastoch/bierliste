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

ActiveRecord::Schema.define(version: 20141125121819) do

  create_table "categories", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semester_id"
    t.float    "amount"
    t.float    "balance"
  end

  create_table "entries", force: true do |t|
    t.integer  "receipt_id"
    t.date     "date"
    t.string   "description"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "semester_id"
  end

  create_table "receipts", force: true do |t|
    t.integer  "category_id"
    t.string   "description"
    t.date     "date"
    t.string   "type",        default: "SimpleReceipt"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semester_id"
    t.string   "credits"
    t.string   "debits"
  end

  create_table "semesters", force: true do |t|
    t.date     "start"
    t.date     "end"
    t.float    "cash"
    t.float    "bank"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "status",          default: "F"
    t.boolean  "adh"
    t.boolean  "here"
    t.float    "startsaldo",      default: 0.0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
