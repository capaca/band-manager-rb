# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091128231544) do

  create_table "attachments", :force => true do |t|
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bands", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "genre_id",   :null => false
    t.integer  "year",       :null => false
    t.string   "city",       :null => false
    t.integer  "country_id", :null => false
    t.text     "about",      :null => false
    t.integer  "logo_id"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string "name"
  end

  create_table "genres", :force => true do |t|
    t.string "title"
  end

  create_table "releases", :force => true do |t|
    t.string   "title"
    t.integer  "year"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", :force => true do |t|
    t.string   "title"
    t.text     "lyrics"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
