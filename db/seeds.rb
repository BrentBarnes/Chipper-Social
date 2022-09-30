# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.create!([{
  email: 'Demo@email.com', 
  full_name: 'Demo User',
  password: 'demonstration', 
  password_confirmation: 'demonstration', 
  avatar_url: 'icons/squirrel.png',
  location: 'New York', 
  education: 'The Odin Project Academy', 
  occupation: 'Developer',
  birthday: '01/01/1995'
}])

i = 1
20.times do
  User.create!([{
    email: Faker::Internet.unique.email, 
    full_name: Faker::Name.unique.name,
    password: 'demonstration', 
    password_confirmation: 'demonstration', 
    # avatar_url: Faker::Avatar.image,
    avatar_url: "avatars/avatar#{i}.jpg",
    location: Faker::Address.state, 
    education: Faker::University.name, 
    occupation: Faker::Job.title,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65)
  }])
  i += 1
end

# Friends
i = 2
5.times do
  Invitation.create!([{
    user_id: 1,
    friend_id: i,
    confirmed: true
  }])
  i += 1
end

# Friend requests
i = 7
5.times do
  Invitation.create!([{
    user_id: i,
    friend_id: 1,
    confirmed: false
  }])
  i += 1
end

# Posts
user_id = 1
21.times do

  number_of_posts = rand(1..3)
  number_of_posts.times do
    Post.create!([{
      user_id: user_id,
      post_content: Faker::Quote.famous_last_words,
      created_at: Faker::Date.unique.between(from: 30.days.ago, to: Date.today)
    }])
  end
  user_id += 1
end
