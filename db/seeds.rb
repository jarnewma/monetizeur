# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  create_table "payment_methods", force: :cascade do |t|
    t.string "category"
    t.string "card_nickname"
    t.string "bank"
    t.date "expiry_date"
    t.boolean "expiry_notification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "photo"

    PaymentMethod.create(category:  "category", card_nickname: "card card_nickname",  bank: " bank",expiry_date: Date.today, user: User.last )
