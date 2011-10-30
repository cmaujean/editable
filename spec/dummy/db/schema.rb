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

ActiveRecord::Schema.define(:version => 20110913183855) do

  create_table "big_pigs", :force => true do |t|
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editable_sources", :force => true do |t|
    t.integer  "editable_id"
    t.string   "editable_type"
    t.text     "editable_data"
    t.string   "processor",      :null => false
    t.string   "editable_field"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meer_kats", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
