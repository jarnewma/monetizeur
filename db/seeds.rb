# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


    PaymentMethod.create(category:  "Mastercard", card_nickname: "Mister Mastercard",  bank: "Deutche",expiry_date: Date.today, user: User[1] )
    PaymentMethod.create(category:  "Amex", card_nickname: "Chex Amex",  bank: " USAA",expiry_date: Date.today, user: User[2] )
    PaymentMethod.create(category:  "Visa", card_nickname: "Vis-a-Visa",  bank: " BE",expiry_date: Date.today, user: User[3] )
    PaymentMethod.create(category:  "Paypal", card_nickname: "PlatyPayPal",  bank: "Chase",expiry_date: Date.today, user: User[4] )

    Subscriptions.create(name: "Spotify", subscription_type: "Spotify", category: "Media", payment_method_id: PaymentMethod[1], user: User[1]  )
    Subscriptions.create(name: "Headspace", subscription_type: "Headspace", category: "Wellbeing", payment_method_id: PaymentMethod[2], user: User[2]  )
    Subscriptions.create(name: "Netflix", subscription_type: "Netflix", category: "Streaming", payment_method_id: PaymentMethod[3], user: User[3]  )
    Subscriptions.create(name: "Hudl", subscription_type: "Hudl", category: "Leisure", payment_method_id: PaymentMethod[4], user: User[4]  )
    Subscriptions.create(name: "LinkedIn", subscription_type: "LinkedIn", category: "Social", payment_method_id: PaymentMethod[1], user: User[1]  )
    Subscriptions.create(name: "Amazon Prime", subscription_type: "Amazon Prime", category: "Shopping", payment_method_id: PaymentMethod[2], user: User[2]  )
    Subscriptions.create(name: "Hello Fresh", subscription_type: "Hello Fresh", category: "Food", payment_method_id: PaymentMethod[3], user: User[3]  )
    Subscriptions.create(name: "iCloud", subscription_type: "iCloud", category: "Technology", payment_method_id: PaymentMethod[4], user: User[4]  )


    User.create(email: "thisemail@site.com", first_name: "Bob", last_name: "Loblaw")
    User.create(email: "thisemail@site.com", first_name: "Jerry", last_name: "Seinfeld")
    User.create(email: "thisemail@site.com", first_name: "Django", last_name: "Reinhart")
    User.create(email: "thisemail@site.com", first_name: "Cosmo", last_name: "Kramer")


    Parasites.create(name: "Larry", parasite_email: "thisemail@site.com", user: User[1])
    Parasites.create(name: "Curly", parasite_email: "thisemail@site.com", user: User[2])
    Parasites.create(name: "Moe", parasite_email: "thisemail@site.com", user: User[3])
    Parasites.create(name: "Shemp", parasite_email: "thisemail@site.com", user: User[4])
