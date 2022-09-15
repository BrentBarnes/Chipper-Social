# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# user = User.new
# user.email = 'Dan@gmail.com'
# user.password = '123456'
# user.password_confirmation = '123456'
# user.save!

User.create! :email => 'Dan@gmail.com', :full_name => 'Dan Danbert', :password => '123456', :password_confirmation => '123456'