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

ActiveRecord::Schema.define(version: 20140123235956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "iec60584_computations", force: true do |t|
    t.float    "emf",                       null: false
    t.float    "temperature",               null: false
    t.string   "type",                      null: false
    t.float    "a3",          default: 0.0, null: false
    t.float    "a2",          default: 0.0, null: false
    t.float    "a1",          default: 0.0, null: false
    t.float    "a0",          default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iec60751_computations", force: true do |t|
    t.float    "resistance",                       null: false
    t.float    "temperature",                      null: false
    t.float    "r0",          default: 100.0,      null: false
    t.float    "a",           default: 0.0039083,  null: false
    t.float    "b",           default: -5.775e-07, null: false
    t.float    "c",           default: -4.183e-12, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
