# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Parasite.destroy_all
PaymentMethod.destroy_all
Subscription.destroy_all

    user_1 = User.create!(email: "thisemail@site.com", password: "123456", first_name: "Bob", last_name: "Loblaw")
    user_2 = User.create(email: "thatemail@site.com", password: "123456", first_name: "Jerry", last_name: "Seinfeld")
    user_3 = User.create(email: "theiremail@site.com", password: "123456", first_name: "Django", last_name: "Reinhart")
    user_4 = User.create(email: "thememail@site.com", password: "123456", first_name: "Cosmo", last_name: "Kramer")

   payment_method_1= PaymentMethod.create!(category:  "Mastercard", card_nickname: "Mister Mastercard",  bank: "Deutche",expiry_date: Date.today, user: user_1 )
   payment_method_2= PaymentMethod.create(category:  "Amex", card_nickname: "Chex Amex",  bank: " USAA",expiry_date: Date.today, user: user_2 )
   payment_method_3= PaymentMethod.create(category:  "Visa", card_nickname: "Vis-a-Visa",  bank: " BE",expiry_date: Date.today, user: user_3 )
   payment_method_4= PaymentMethod.create(category:  "Paypal", card_nickname: "PlatyPayPal",  bank: "Chase",expiry_date: Date.today, user: user_4 )

    subscription_1 = Subscription.create!(name: "Spotify", subscription_type: "Spotify", category: "Media", payment_method: payment_method_1, user: user_1, billing_date: Date.today, cost: 5  )
    subscription_2 = Subscription.create(name: "Headspace", subscription_type: "Headspace", category: "Wellbeing", payment_method: payment_method_2, user: user_2, billing_date: Date.today, cost: 8  )
    subscription_3 = Subscription.create(name: "Netflix", subscription_type: "Netflix", category: "Streaming", payment_method: payment_method_3, user: user_3, billing_date: Date.today, cost: 19 )
    subscription_4 = Subscription.create(name: "Hudl", subscription_type: "Hudl", category: "Leisure", payment_method: payment_method_4, user: user_4, billing_date: Date.today, cost: 7 )
    subscription_5 = Subscription.create(name: "LinkedIn", subscription_type: "LinkedIn", category: "Social", payment_method: payment_method_1, user: user_4, billing_date: Date.today, cost: 3 )
    subscription_6 = Subscription.create(name: "Amazon Prime", subscription_type: "Amazon Prime", category: "Shopping", payment_method: payment_method_2, user: user_2, billing_date: Date.today, cost: 5 )
    subscription_7 = Subscription.create(name: "Hello Fresh", subscription_type: "Hello Fresh", category: "Food", payment_method: payment_method_3, user: user_3, billing_date: Date.today, cost: 45 )
    subscription_8 = Subscription.create(name: "iCloud", subscription_type: "iCloud", category: "Technology", payment_method: payment_method_4, user: user_4, billing_date: Date.today, cost: 35  )

    parasite_1 = Parasite.create!(name: "Larry", parasite_email: "thisemail@site.com", user: user_1)
    parasite_2 = Parasite.create(name: "Curly", parasite_email: "thisemail@site.com", user: user_2)
    parasite_3 = Parasite.create(name: "Moe", parasite_email: "thisemail@site.com", user: user_3)
    parasite_4 = Parasite.create(name: "Shemp", parasite_email: "thisemail@site.com", user: user_4)
