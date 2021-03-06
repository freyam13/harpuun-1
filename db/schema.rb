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

ActiveRecord::Schema.define(:version => 20121214172511) do

  create_table "clients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "company"
    t.string   "avatar"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "phone"
    t.string   "location"
  end

  create_table "offers", :force => true do |t|
    t.integer  "project_id"
    t.integer  "accepted_by"
    t.date     "offered_on"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "reward"
    t.string   "deadline"
    t.integer  "client_id"
    t.integer  "skill_id1"
    t.integer  "skill_id2"
    t.integer  "skill_id3"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "completer_id"
    t.integer  "actual_starter_id"
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "starters", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "avatar"
    t.integer  "skill_id1"
    t.integer  "skill_id2"
    t.integer  "skill_id3"
    t.integer  "year"
    t.string   "quarter"
    t.integer  "class_id1"
    t.integer  "class_id2"
    t.integer  "class_id3"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "twitter"
    t.boolean  "admin",           :default => false
    t.string   "location"
    t.string   "phone"
  end

end
