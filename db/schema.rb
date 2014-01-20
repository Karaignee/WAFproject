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

ActiveRecord::Schema.define(:version => 20131210183036) do

  create_table "comments", :force => true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["forum_id"], :name => "index_comments_on_forum_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "forums", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "forums", ["user_id"], :name => "index_forums_on_user_id"

  create_table "homes", :force => true do |t|
    t.string   "index"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ngo_profiles", :force => true do |t|
    t.string   "name"
    t.text     "about"
    t.text     "details"
    t.text     "links"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ngo_profiles", ["user_id"], :name => "index_ngo_profiles_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "user_groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_an_admin"
    t.boolean  "is_a_charity"
    t.boolean  "is_a_volunteer"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "crypted_password",    :limit => 128, :default => "",    :null => false
    t.string   "password_salt",       :limit => 128, :default => "",    :null => false
    t.string   "perishable_token"
    t.string   "single_access_token"
    t.integer  "login_count",                        :default => 0
    t.integer  "failed_login_count",                 :default => 0
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "active",                             :default => false, :null => false
    t.integer  "user_group_id"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "persistence_token"
  end

  create_table "vol_profiles", :force => true do |t|
    t.text     "about"
    t.text     "details"
    t.text     "skills"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vol_profiles", ["user_id"], :name => "index_vol_profiles_on_user_id"

end
