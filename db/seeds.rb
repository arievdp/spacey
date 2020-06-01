# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
email password

puts 'Creating 10 fake users and 10 fake rockets'
10.times do
  new_user = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  user_name: username.sample
  phone_number: Faker::PhoneNumber.phone_number,
  avatar: "https://source.unsplash.com/random/200x200"
  )
  new_user.save!
  new_rocket = Rocket.new(
    name: Faker::Creature::Animal.name,
    payload: Faker::Number.number(digits: 3),
    price: Faker::Number.decimal(l_digits: 2)
    description: Faker::Movies::StarWars.quote,
    location: Faker::Address.street_address,
    rocket_images: "https://loremflickr.com/320/240/rocket"
    )
  new_rocket.user = new_user
  new_rocket.save!
end

puts 'creating 10 fake orders'
10.times do
  new_order = Order.new(
  start_date: Faker::Date.between(from: 5.days.ago, to: Date.today),
  end_date: Faker::Date.forward(days: 23),
  status: ["Booked", "Available", "Cancelled"].sample,
  total_price: Faker::Number.decimal(l_digits: 2)
  )
  new_order.save!
end

puts 'creating 10 fake reviews'

10.times do
  new_review = Review.new(
  content: Faker::Movies::StarWars.wookiee_sentence,
  rating: Faker::Number.between(from: 1, to: 10)
  )
  new_review.save!
end



puts 'Finished!'




# User.New(first_name: "")


# Rocket.create(name: "Magpie 9", payload: "900 Kilograms", price: "99", description: "A good ole' rocket")

