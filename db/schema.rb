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

ActiveRecord::Schema.define(version: 20140614224337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appliances", force: true do |t|
    t.string   "name"
    t.float    "consumption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "energy_logs", force: true do |t|
    t.integer  "user_id"
    t.datetime "timestamp"
    t.integer  "consumption"
    t.boolean  "checked"
  end

  create_table "energy_prices", force: true do |t|
    t.datetime "timestamp"
    t.float    "eur"
  end

  create_table "energy_productions", force: true do |t|
    t.datetime "timestamp"
    t.boolean  "actual",                     null: false
    t.string   "energy",         limit: 100
    t.string   "company",        limit: 100
    t.float    "production_mwh"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patterns", force: true do |t|
    t.string   "pattern_id"
    t.integer  "appliance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_statuses", force: true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vb_test", force: true do |t|
    t.string "name", limit: 50
  end

end
