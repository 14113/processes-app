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

ActiveRecord::Schema.define(version: 20141213172446) do

  create_table "actions", force: true do |t|
    t.integer  "iteration_id"
    t.integer  "todo_id"
    t.boolean  "done",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "actions", ["iteration_id"], name: "index_actions_on_iteration_id", using: :btree
  add_index "actions", ["todo_id"], name: "index_actions_on_todo_id", using: :btree

  create_table "iterations", force: true do |t|
    t.integer  "trip_id"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todos", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "todos", ["trip_id"], name: "index_todos_on_trip_id", using: :btree

  create_table "trips", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
