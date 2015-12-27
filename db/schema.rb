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

ActiveRecord::Schema.define(version: 20151223185006) do

  create_table "ftcs", force: :cascade do |t|
    t.string   "code",       null: false
    t.string   "shortdesc",  null: false
    t.string   "longdesc",   null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ftcs", ["user_id"], name: "index_ftcs_on_user_id"

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

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
