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

ActiveRecord::Schema.define(version: 2019_06_29_040449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chemical_equipments", force: :cascade do |t|
    t.integer "work_item_id"
    t.integer "niche_id"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chemical_properties", force: :cascade do |t|
    t.integer "work_item_id"
    t.integer "niche_id"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chemical_safety_features", force: :cascade do |t|
    t.integer "work_item_id"
    t.integer "niche_id"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "fire_extinguisher", default: false
    t.boolean "first_aid_kit", default: false
    t.boolean "ppe", default: false
    t.boolean "oily_waste_bin", default: false
    t.boolean "safety_cabinet", default: false
    t.boolean "lock_tag", default: false
    t.boolean "eye_washer", default: false
    t.string "inspections"
    t.text "comments"
    t.text "grade"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "niche_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturing_equipments", force: :cascade do |t|
    t.integer "work_item_id"
    t.integer "niche_id"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturing_properties", force: :cascade do |t|
    t.integer "work_item_id"
    t.integer "niche_id"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturing_safety_features", force: :cascade do |t|
    t.integer "work_item_id"
    t.integer "niche_id"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "niches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "work_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "accuracy"
    t.float "timeliness"
    t.float "grammar"
    t.float "detail"
    t.text "comment"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin"
  end

  create_table "work_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
  end

end
