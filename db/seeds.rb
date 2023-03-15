# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
users = User.all

puts 'Creating 3 fake cars...'
Car.destroy_all
  car = Car.new(
    brand: Faker::Vehicle.manufacture,
    model: Faker::Vehicle.make_and_model,
    year:  Faker::Vehicle.year,
    user_id: users.sample.id,
    address: "Humboldt 1967 Buenos Aires Argentina", #=> "282 Kevin Brook",
    price: 200_00
  )
  car.save!

  car = Car.new(
    brand: Faker::Vehicle.manufacture,
    model: Faker::Vehicle.make_and_model,
    year:  Faker::Vehicle.year,
    user_id: users.sample.id,
    address: "Rua Jerico 193 Sao Paulo Brazil", #=> "282 Kevin Brook",
    price: 200_00
  )
  car.save!

  car = Car.new(
    brand: Faker::Vehicle.manufacture,
    model: Faker::Vehicle.make_and_model,
    year:  Faker::Vehicle.year,
    user_id: users.sample.id,
    address: "16 Villa Gaudelet, Paris", #=> "282 Kevin Brook",
    price: 200_00
  )
  car.save!
puts 'Finished!'
