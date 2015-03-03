require 'faker'

# Users
User.create!(first_name:"Example",
             last_name: "User",
             email: "exampleuser@gmail.com",
             password: "password",
             password_confirmation: "password")



99.times do |n|
  first_name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(first_name: first_name,
              last_name: "Dickface",
              email: email,
              password: password,
              password_confirmation: password)
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
  fake_url = Faker::Lorem.sentence(1)
  fake_comment = Faker::Lorem.sentence(2)
  fake_content = Faker::Lorem.sentence(4)
  users.each { |user| user.articles.create!(url: fake_url, initial_comment: fake_comment,
    content: fake_content ) }
end

# Following relationships
users = User.all
user  = users.first
subscribing = users[2..50]
subscribers = users[3..40]
subscribing.each { |subscribed| user.subscribe(subscribed) }
subscribers.each { |subscriber| subscriber.subscribe(user) }