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

ActiveRecord::Schema.define(version: 20140911050844) do

  create_table "contestants", force: true do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "profile_name",           default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes_count",            default: 0
    t.float    "score",                  default: 0.0
  end

  add_index "contestants", ["email"], name: "index_contestants_on_email", unique: true
  add_index "contestants", ["reset_password_token"], name: "index_contestants_on_reset_password_token", unique: true

  create_table "duo_picks", force: true do |t|
    t.integer  "week_id"
    t.text     "picks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "duo_picks", ["week_id"], name: "index_duo_picks_on_week_id"

  create_table "games", force: true do |t|
    t.integer  "week_id"
    t.integer  "home_team_id"
    t.string   "home_team_ttalk"
    t.integer  "away_team_id"
    t.string   "away_team_ttalk"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winning_team_id"
    t.integer  "home_score",      default: 0, null: false
    t.integer  "away_score",      default: 0, null: false
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tiebreakers", force: true do |t|
    t.integer  "home_score"
    t.integer  "away_score"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contestant_id"
  end

  create_table "votes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contestant_id"
    t.integer  "game_id"
    t.integer  "team_id"
  end

  add_index "votes", ["contestant_id"], name: "index_votes_on_contestant_id"
  add_index "votes", ["game_id"], name: "index_votes_on_game_id"
  add_index "votes", ["team_id"], name: "index_votes_on_team_id"

  create_table "weeks", force: true do |t|
    t.integer  "number"
    t.boolean  "status"
    t.integer  "previous_week_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winning_contestant_id"
    t.integer  "tiebreaker_game_id"
    t.integer  "next_week_id"
  end

  add_index "weeks", ["next_week_id"], name: "index_weeks_on_next_week_id"

end
