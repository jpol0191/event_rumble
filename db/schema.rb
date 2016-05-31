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




ActiveRecord::Schema.define(version: 20160531190535) do



ActiveRecord::Schema.define(version: 20160531193550) do






  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id", using: :btree

  create_table "group_members", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "group_members", ["group_id"], name: "index_group_members_on_group_id", using: :btree
  add_index "group_members", ["user_id"], name: "index_group_members_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "keywords", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "keywords", ["category_id"], name: "index_keywords_on_category_id", using: :btree

  create_table "past_event_users", force: :cascade do |t|
    t.integer  "past_event_id"
    t.integer  "friend_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "past_event_users", ["past_event_id"], name: "index_past_event_users_on_past_event_id", using: :btree

  create_table "past_events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "url"
    t.string   "location"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "past_events", ["user_id"], name: "index_past_events_on_user_id", using: :btree

  create_table "power_ups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "power_ups", ["user_id"], name: "index_power_ups_on_user_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "phone"
    t.string   "lname"
    t.string   "fname"
<<<<<<< 6d0d9318a04e167e76755f07bbc9cbe845b47e78
    t.string   "uid"
=======
    t.integer  "uid"
>>>>>>> Adding facebook columns to user model
    t.string   "channel"
    t.string   "image"
    t.string   "oauth_token"
    t.string   "oauth_expires_at"
<<<<<<< 9da3ee2673c86f7947e31b1b937c5ee87831915a
<<<<<<< 6d0d9318a04e167e76755f07bbc9cbe845b47e78
    t.string   "provider"
    t.string   "fullname"
    t.boolean  "is_online"
=======
>>>>>>> Adding facebook columns to user model
=======
    t.string   "provider"
    t.string   "fullname"
>>>>>>> Adding facebook columns
  end

  add_foreign_key "friends", "users"
  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "keywords", "categories"
  add_foreign_key "past_event_users", "past_events"
  add_foreign_key "past_events", "users"
  add_foreign_key "power_ups", "users"
  add_foreign_key "rooms", "users"
end
