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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140712025320) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "active"
  end

  create_table "match_images", :force => true do |t|
    t.integer  "match_id"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer  "round_id"
    t.integer  "match_number"
    t.string   "player1_name"
    t.string   "player1_genre"
    t.string   "player1_type"
    t.string   "player1_free_1"
    t.string   "player1_free_2"
    t.string   "player1_free_3"
    t.string   "player2_name"
    t.string   "player2_genre"
    t.string   "player2_type"
    t.string   "player2_free_1"
    t.string   "player2_free_2"
    t.string   "player2_free_3"
    t.string   "player3_name"
    t.string   "player3_genre"
    t.string   "player3_type"
    t.string   "player3_free_1"
    t.string   "player3_free_2"
    t.string   "player3_free_3"
    t.string   "player4_name"
    t.string   "player4_genre"
    t.string   "player4_type"
    t.string   "player4_free_1"
    t.string   "player4_free_2"
    t.string   "player4_free_3"
    t.text     "notes"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "player1_score"
    t.string   "player2_score"
    t.string   "player3_score"
    t.string   "player4_score"
    t.string   "court"
    t.integer  "player1_rank",   :default => 4
    t.integer  "player2_rank",   :default => 4
    t.integer  "player3_rank",   :default => 4
    t.integer  "player4_rank",   :default => 4
    t.float    "player1_rate",   :default => 0.0
    t.float    "player2_rate",   :default => 0.0
    t.float    "player3_rate",   :default => 0.0
    t.float    "player4_rate",   :default => 0.0
    t.string   "image"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
