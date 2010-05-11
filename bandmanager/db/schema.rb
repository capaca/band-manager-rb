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

ActiveRecord::Schema.define(:version => 20100424203409) do

  create_table "attachments", :force => true do |t|
    t.string   "type"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "song_id"
    t.integer  "band_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "band_translations", :force => true do |t|
    t.integer  "band_id"
    t.string   "locale"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "band_translations", ["band_id"], :name => "index_band_translations_on_band_id"

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.string   "screen_name"
    t.integer  "genre_id"
    t.integer  "year"
    t.string   "city"
    t.integer  "country_id"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "bands_concerts", :id => false, :force => true do |t|
    t.integer "band_id"
    t.integer "concert_id"
  end

  create_table "concert_translations", :force => true do |t|
    t.integer  "concert_id"
    t.string   "locale"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "concert_translations", ["concert_id"], :name => "index_concert_translations_on_concert_id"

  create_table "concerts", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.string   "city"
    t.string   "region"
    t.text     "details"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "flyer_file_name"
    t.string   "flyer_content_type"
    t.integer  "flyer_file_size"
    t.datetime "flyer_updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string "name"
  end

  create_table "genres", :force => true do |t|
    t.string "title"
  end

  create_table "post_translations", :force => true do |t|
    t.integer  "post_id"
    t.string   "locale"
    t.text     "content"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_translations", ["post_id"], :name => "index_post_translations_on_post_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "band_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "release_translations", :force => true do |t|
    t.integer  "release_id"
    t.string   "locale"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "release_translations", ["release_id"], :name => "index_release_translations_on_release_id"

  create_table "release_types", :force => true do |t|
    t.string "title"
  end

  create_table "releases", :force => true do |t|
    t.integer  "band_id"
    t.integer  "type_id"
    t.string   "title"
    t.integer  "year"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  create_table "songs", :force => true do |t|
    t.integer  "release_id"
    t.string   "title"
    t.integer  "track_number"
    t.string   "time"
    t.text     "lyrics"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
