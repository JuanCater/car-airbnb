# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
test_user = User.create!(password: "123456", email: "bellebrown619@gmail.com")

puts 'Creating 10 fake cars...'
10.times do
  car = Car.new(
    brand: Faker::Vehicle.manufacture,
    model: Faker::Vehicle.make_and_model,
    year:  Faker::Vehicle.year,
    user_id: test_user.id
    price: 1
  )
  car.save!
end
puts 'Finished!'
