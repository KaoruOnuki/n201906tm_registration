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

ActiveRecord::Schema.define(version: 2019_03_11_034855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "admin_name", null: false
    t.string "admin_email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_email"], name: "index_admin_users_on_admin_email", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.string "company_name"
    t.string "website"
    t.text "content"
    t.boolean "preferred_contact"
    t.string "contact_time"
    t.boolean "experienced"
    t.boolean "agreed_regulation"
    t.boolean "used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "trademark_id"
    t.string "tmname"
  end

  create_table "states", force: :cascade do |t|
    t.boolean "status_investigation"
    t.boolean "status_apply"
    t.boolean "status_judge"
    t.boolean "status_registration"
    t.bigint "trademark_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trademark_id"], name: "index_states_on_trademark_id"
  end

  create_table "trademarks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tm_name", null: false
    t.string "tm_image"
    t.text "description", null: false
    t.text "investigation_result"
    t.date "investigation_date"
    t.string "apply_number"
    t.date "apply_date"
    t.text "judge_status"
    t.string "registration_number"
    t.date "registration_date"
    t.integer "maintenance_period"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_trademarks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.integer "phone_number"
    t.string "email", null: false
    t.integer "postal_code"
    t.string "prefecture"
    t.string "address1"
    t.string "address2"
    t.string "company_name"
    t.string "website"
    t.string "contact_method"
    t.string "contact_time"
    t.boolean "experienced"
    t.boolean "agreed_regulation"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "trademarks", "users"
end
