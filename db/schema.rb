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

ActiveRecord::Schema.define(version: 20150524083516) do

  create_table "levels", force: true do |t|
    t.string "mark"
  end

  create_table "parking_spaces", force: true do |t|
    t.integer "level_id"
    t.integer "vehicle_id"
    t.string  "type"
    t.string  "number"
  end

  add_index "parking_spaces", ["level_id"], name: "index_parking_spaces_on_level_id"
  add_index "parking_spaces", ["number"], name: "index_parking_spaces_on_number", unique: true

  create_table "vehicles", force: true do |t|
    t.integer "parking_space_id"
    t.string  "licence_plate"
    t.string  "type"
  end

  add_index "vehicles", ["licence_plate"], name: "index_vehicles_on_licence_plate", unique: true
  add_index "vehicles", ["parking_space_id"], name: "index_vehicles_on_parking_space_id"

end
