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

ActiveRecord::Schema.define(:version => 20110202100106) do

  create_table "distilleries", :force => true do |t|
    t.string   "title"
    t.float    "lat"
    t.float    "lng"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "distilleries", ["title"], :name => "index_distilleries_on_title"

  create_table "whiskies", :force => true do |t|
    t.string   "title",         :null => false
    t.text     "body"
    t.integer  "rating"
    t.string   "image_url"
    t.string   "url"
    t.integer  "distillery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "whiskies", ["distillery_id"], :name => "index_whiskies_on_distillery_id"
  add_index "whiskies", ["rating"], :name => "index_whiskies_on_rating"

end
