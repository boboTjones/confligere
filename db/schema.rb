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

ActiveRecord::Schema.define(version: 20131113182810) do

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "notes"
    t.integer "severity"
    t.string "type"
    t.datetime "occurred_at"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expectations", force: :cascade do |t|
    t.integer "user_id"
    t.string "summary"
    t.integer "scale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fakes", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
    t.string "first_name"
    t.string "last_name"
    t.string "marital_status"
    t.string "orientation"
    t.string "gender"
    t.boolean "so_is_user", default: false
    t.integer "age"
    t.string "occupation"
    t.integer "education"
    t.integer "children"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string "summary"
    t.integer "scale"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journals", force: :cascade do |t|
    t.string "title"
    t.text "entry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.string "first_name"
    t.string "nickname"
    t.integer "duration"
    t.integer "age"
    t.boolean "primary"
    t.string "first_contact"
    t.string "occupation"
    t.integer "education"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
    t.string "first_name"
    t.string "last_name"
    t.string "marital_status"
    t.string "orientation"
    t.string "gender"
    t.boolean "so_is_user", default: false
    t.integer "age"
    t.string "occupation"
    t.integer "education"
    t.integer "children"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
