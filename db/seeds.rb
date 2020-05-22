# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Viet bach",
            email: "example@gmail.com",
            password:"123456",
            password_confirmation: "123456",
            admin: true)
    # Generate a bunch of additional users.
    9.times do |n|
        name = Faker::Name.name
        email = "example-#{n+1}@gmail.com"
        password = "password"
        User.create!(name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end
    users = User.order(:created_at).take(6)
    6.times do
    content = Faker::Lorem.sentence(word_count: 5)
    users.each { |user| user.microposts.create!(content: content) }
    end

        # Create following relationships.
    users = User.all
    user = users.first
    following = users[2..6]
    followers = users[3..40]
    following.each { |followed| user.follow(followed) }
    followers.each { |follower| follower.follow(user) }