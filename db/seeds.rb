# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do |n|
  email = Faker::Internet.email
  name = Faker::Cat.name
  password = "password"
  uid = SecureRandom.uuid
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password,
               uid: uid
               )
end

n = 1
while n <= 10
  Topic.create(
    content: "bbb",
    user_id: n,
  )
  n = n + 1
end
