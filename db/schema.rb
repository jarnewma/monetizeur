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

ActiveRecord::Schema.define(version: 2019_03_12_131303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parasites", force: :cascade do |t|
    t.string "name"
    t.string "parasite_email"
    t.boolean "notify_parasite"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parasites_on_user_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "category"
    t.string "card_nickname"
    t.string "bank"
    t.date "expiry_date"
    t.boolean "expiry_notification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_payment_methods_on_user_id"
  end

  create_table "subscription_parasites", force: :cascade do |t|
    t.bigint "parasite_id"
    t.bigint "subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parasite_id"], name: "index_subscription_parasites_on_parasite_id"
    t.index ["subscription_id"], name: "index_subscription_parasites_on_subscription_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name"
    t.string "subscription_type"
    t.integer "cost"
    t.date "creation_date"
    t.string "category"
    t.boolean "renewal_notification"
    t.date "notification_date"
    t.bigint "payment_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["payment_method_id"], name: "index_subscriptions_on_payment_method_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "subscription_parasites", "parasites"
  add_foreign_key "subscription_parasites", "subscriptions"
  add_foreign_key "subscriptions", "payment_methods"
  add_foreign_key "subscriptions", "users"
end
