# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#Create Users

10.times do
  User.create!(
    username: Faker::Internet.unique.user_name,
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password",
    confirmed_at: Time.now.utc
  )
end
users = User.all

50.times do
  Wiki.create!(
    title: Faker::Lorem.words,
    body: Faker::Lorem.paragraph(2),
    private: false,
    user: users.sample
  )
end

admin = User.create!(
  username: "admin",
  email: "jdembinski@gmail.com",
  password: "password",
  password_confirmation: "password",
  role: :admin,
  confirmed_at: Time.now.utc
)

puts "Seed File Completed"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "1 Admin User Created"
