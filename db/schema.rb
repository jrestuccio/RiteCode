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

ActiveRecord::Schema.define(version: 20151214210645) do

  create_table "ftcs", force: :cascade do |t|
    t.string   "code",       null: false
    t.boolean  "exception",  null: false
    t.string   "shortdesc",  null: false
    t.string   "longdesc",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i10gems", force: :cascade do |t|
    t.text     "i10code"
    t.text     "i9code"
    t.boolean  "approximate"
    t.boolean  "nomap"
    t.boolean  "combination"
    t.integer  "scenario"
    t.integer  "choicelist"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "i9gems", force: :cascade do |t|
    t.text     "i9code"
    t.text     "i10code"
    t.boolean  "approximate"
    t.boolean  "nomap"
    t.boolean  "combination"
    t.integer  "scenario"
    t.integer  "choicelist"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "i9gems", ["i9code"], name: "index_i9gems_on_i9code"

  create_table "icd10s", force: :cascade do |t|
    t.string   "code"
    t.boolean  "exception"
    t.string   "shortdesc"
    t.string   "longdesc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "icd9s", force: :cascade do |t|
    t.string   "code"
    t.string   "shortdesc"
    t.string   "longdesc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
