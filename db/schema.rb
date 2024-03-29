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

ActiveRecord::Schema.define(:version => 20120327005942) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.string   "email"
    t.string   "phone"
    t.boolean  "visible"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
  end

  create_table "events", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.string   "artist"
    t.time     "starttime"
    t.date     "startdate"
    t.date     "finishdate"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "events", ["company_id"], :name => "index_events_on_company_id"

  create_table "photos", :force => true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "event_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "company_id"
    t.string   "image_description"
  end

end
