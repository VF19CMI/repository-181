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

ActiveRecord::Schema.define(version: 20141012034449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chart_instances", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",            null: false
  end

  add_index "chart_instances", ["user_id"], name: "index_chart_instances_on_user_id", using: :btree

  create_table "entries", force: true do |t|
    t.datetime "point_time",                        null: false
    t.float    "point_value",                       null: false
    t.integer  "sequence_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source",      default: "automatic", null: false
    t.boolean  "ignored",     default: false,       null: false
  end

  add_index "entries", ["point_time"], name: "index_entries_on_point_time", using: :btree
  add_index "entries", ["sequence_id"], name: "index_entries_on_sequence_id", using: :btree

  create_table "sequences", force: true do |t|
    t.string   "title",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "processor"
    t.boolean  "active",     default: true
    t.integer  "user_id",                   null: false
  end

  add_index "sequences", ["user_id"], name: "index_sequences_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "organization"
    t.string   "provider"
    t.string   "uid"
    t.json     "sfdc_config"
    t.boolean  "sfdc_setup",             default: false
    t.text     "sfdc_oauth_token"
    t.text     "sfdc_refresh_token"
    t.text     "sfdc_instance_url"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
