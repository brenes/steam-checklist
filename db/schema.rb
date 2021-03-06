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

ActiveRecord::Schema.define(version: 20150221162145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string   "appid"
    t.string   "name"
    t.string   "icon_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owned_games", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "play_time",  default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "owned_games", ["game_id"], name: "index_owned_games_on_game_id", using: :btree
  add_index "owned_games", ["user_id"], name: "index_owned_games_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "name"
    t.string   "avatar_url"
    t.string   "profile_url"
    t.string   "steamid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "owned_games", "games"
  add_foreign_key "owned_games", "users"
end
