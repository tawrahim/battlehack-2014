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

ActiveRecord::Schema.define(version: 20140809175534) do

  create_table "bids", force: true do |t|
    t.integer  "user_id"
    t.integer  "number_of_tokens"
    t.integer  "raffle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "raffles", force: true do |t|
    t.integer  "seller_id"
    t.string   "picture_url"
    t.text     "description"
    t.string   "charity_name"
    t.text     "pickup_location"
    t.integer  "winner_id"
    t.datetime "end_raffle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
