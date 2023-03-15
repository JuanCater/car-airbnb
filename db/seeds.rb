# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
users = User.all
require "open-uri"

puts 'Creating 5 fake cars...'
Car.destroy_all
  car1 = Car.new(
    brand: "Ford",
    model: "F150",
    year:  "2020",
    user_id: users.sample.id,
    address: "Humboldt 1967 Buenos Aires Argentina", #=> "282 Kevin Brook",
    price: 200_00
  )
file = URI.open("https://www.chevrolet.com/content/dam/chevrolet/na/us/english/index/vehicle-groups/trucks/04-images/2023-colorado-segment.jpg?imwidth=960")
car1.photos.attach(io: file, filename: "truck.png", content_type: "image/png")
car1.save!
  car2 = Car.new(
    brand: "BMW",
    model: "X5",
    year:  "2018",
    user_id: users.sample.id,
    address: "Rua Jerico 193 Sao Paulo Brazil", #=> "282 Kevin Brook",
    price: 200_00
  )
  file = URI.open("https://i.ytimg.com/vi/zvLzWDqoOdI/maxresdefault.jpg")
  car2.photos.attach(io: file, filename: "bmw.png", content_type: "image/png")
  car2.save!

  car3 = Car.new(
    brand: "Volvo",
    model: "XC-90",
    year:  "2006",
    user_id: users.sample.id,
    address: "Rua Jerico 195 Sao Paulo Brazil", #=> "282 Kevin Brook",
    price: 200_00
  )
  file = URI.open("https://www.topgear.com/sites/default/files/cars-car/image/2019/10/258012_updated_volvo_xc90.jpg?w=1280&h=720")
  car3.photos.attach(io: file, filename: "volvo.png", content_type: "image/png")
  car3.save!

  car4 = Car.new(
    brand: "Jeep",
    model: "Wrangler",
    year:  "2009",
    user_id: users.sample.id,
    address: "Humboldt 1967 Buenos Aires Argentina", #=> "282 Kevin Brook",
    price: 200_00
  )
  file = URI.open("https://images.cars.com/cldstatic/wp-content/uploads/jeep-wrangler-willys-4xe-2023-exterior-oem-02.jpg")
  car4.photos.attach(io: file, filename: "jeep.png", content_type: "image/png")
  car4.save!

  car5 = Car.new(
    brand: "Porsche",
    model: "Panamera",
    year:  "2010",
    user_id: users.sample.id,
    address: "Humboldt 1969 Buenos Aires Argentina", #=> "282 Kevin Brook",
    price: 200_00
  )
  file = URI.open("https://hips.hearstapps.com/hmg-prod/images/2023-porsche-panamera-turbo-s-102-1671562605.jpg?crop=0.761xw:0.856xh;0.106xw,0.0513xh&resize=640:*")
  car5.photos.attach(io: file, filename: "prosche.png", content_type: "image/png")
  car5.save!
puts 'Finished!'
