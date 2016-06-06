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

ActiveRecord::Schema.define(version: 20160606121408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer  "m_id"
    t.string   "link"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "post_id"
    t.integer  "comment_id"
  end

  create_table "matches_lists", force: :cascade do |t|
    t.string   "team1"
    t.string   "team2"
    t.string   "t1_logo"
    t.string   "t2_logo"
    t.string   "t1_score"
    t.string   "t2_score"
    t.string   "link"
    t.integer  "m_id"
    t.integer  "status"
    t.integer  "result"
    t.integer  "format"
    t.integer  "game_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "game_date"
  end

end
