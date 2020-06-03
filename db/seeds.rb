require 'faker'

login_emails = ["rithvik@spacey.com", "lacy@spacey.com", "jason@spacey.com", "arie@spacey.com"]
password = "123456"

puts 'Creating 4 fake users, rockets, orders and reviews'
arraynum = 0
4.times do
  new_user = User.new(
  email: login_emails[arraynum],
  password: password,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  avatar: "https://source.unsplash.com/random/200x200"
  )
  new_user.save!
  new_rocket = Rocket.new(
    name: Faker::Creature::Animal.name,
    payload: Faker::Number.number(digits: 3),
    price: Faker::Number.decimal(l_digits: 2),
    description: Faker::Movies::StarWars.quote,
    location: Faker::Address.street_address,

    )
  new_rocket.user = new_user
  new_rocket.save!
  new_order = Order.new(
    start_date: Faker::Date.between(from: 5.days.ago, to: Date.today),
    end_date: Faker::Date.forward(days: 23),
    status: ["Booked", "Available", "Cancelled"].sample,
    total_price: Faker::Number.decimal(l_digits: 2)
    )
  new_order.user = new_user
  new_order.rocket = new_rocket
  new_order.save!
  new_review = Review.new(
    content: Faker::Movies::StarWars.wookiee_sentence,
    rating: Faker::Number.between(from: 1, to: 10)
    )
  new_review.order = new_order
  new_review.save!
  arraynum += 1
end

puts 'Finished!'
