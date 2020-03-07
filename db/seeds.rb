# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:'Example User',
             email: 'example@user.org',
             username: 'example_user',
             password: 'password',
             password_confirmation: 'password')
5.times do |x|
  Post.create!(content: Faker::ChuckNorris.fact,
               user_id: User.find_by(email: 'example@user.org').id)
end

99.times do |n|
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  name  = first_name + ' ' + last_name
  email = Faker::Internet.email
  username = first_name + '_' + last_name
  password = "password"
  User.create!(name: name,
               email: email,
               username: username,
               password: password,
               password_confirmation: password)
  5.times do |x|
    Post.create!(content: Faker::ChuckNorris.fact,
                 user_id: User.find_by(email: email).id)
  end
end
