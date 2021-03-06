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

ActiveRecord::Schema.define(version: 20150329181602) do

  create_table "articles", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "datetime"
    t.text     "content"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "initial_comment"
    t.integer  "user_id"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "group_invitations", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.integer  "user_id"
    t.string   "group_name"
    t.boolean  "private"
    t.boolean  "subscribers_only"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "article_id"
  end

  add_index "likes", ["article_id"], name: "index_likes_on_article_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "posts", force: true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "subscriber_id"
    t.integer  "subscribed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["subscribed_id"], name: "index_subscriptions_on_subscribed_id"
  add_index "subscriptions", ["subscriber_id", "subscribed_id"], name: "index_subscriptions_on_subscriber_id_and_subscribed_id", unique: true
  add_index "subscriptions", ["subscriber_id"], name: "index_subscriptions_on_subscriber_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
