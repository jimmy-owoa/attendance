# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_31_041826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "member_id", null: false
    t.float "temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_attendees_on_event_id"
    t.index ["member_id"], name: "index_attendees_on_member_id"
  end

  create_table "church_annexes", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "capacity"
    t.datetime "enabled"
    t.bigint "church_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["church_id"], name: "index_church_annexes_on_church_id"
  end

  create_table "churches", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "event_type"
    t.text "description"
    t.bigint "church_annex_id", null: false
    t.integer "offering"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["church_annex_id"], name: "index_events_on_church_annex_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.string "legal_number"
    t.datetime "enabled"
    t.bigint "church_id", null: false
    t.bigint "church_annex_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.datetime "is_admin"
    t.index ["church_annex_id"], name: "index_members_on_church_annex_id"
    t.index ["church_id"], name: "index_members_on_church_id"
    t.index ["legal_number"], name: "index_members_on_legal_number"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "lastname"
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "attendees", "events"
  add_foreign_key "attendees", "members"
  add_foreign_key "church_annexes", "churches"
  add_foreign_key "events", "church_annexes"
  add_foreign_key "members", "church_annexes"
  add_foreign_key "members", "churches"
  add_foreign_key "members", "users"
end
