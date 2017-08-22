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

ActiveRecord::Schema.define(version: 20170227192140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", id: :serial, force: :cascade do |t|
    t.integer "team_id"
    t.date "today"
    t.datetime "response_sent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_days_on_team_id"
  end

  create_table "responses", id: :serial, force: :cascade do |t|
    t.integer "team_id"
    t.integer "day_id"
    t.integer "user_id"
    t.string "slug"
    t.string "response_a"
    t.string "response_b"
    t.string "response_c"
    t.datetime "user_responded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_responses_on_day_id"
    t.index ["slug"], name: "index_responses_on_slug", unique: true
    t.index ["team_id"], name: "index_responses_on_team_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "team_users", id: :serial, force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
    t.boolean "admin", default: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_users_on_team_id"
    t.index ["user_id"], name: "index_team_users_on_user_id"
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.string "slug"
    t.integer "standup_start_hour", default: 8
    t.integer "standup_start_minute", default: 0
    t.integer "standup_end_hour", default: 10
    t.integer "standup_end_minute", default: 0
    t.string "question_a", default: "What did you do yesterday?"
    t.string "question_b", default: "What will you do today?"
    t.string "question_c", default: "Are there any impediments in your way?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_teams_on_slug", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
