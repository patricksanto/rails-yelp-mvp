# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#  ["chinese", "italian", "japanese", "french", "belgian"],

require 'faker'

5.times do
  restaurante = Restaurant.new(
    name: Faker::Restaurant.name,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
  restaurante.save
  review = Review.new(
    content: Faker::Restaurant.review,
    rating: (0..5).to_a.sample
  )
  review.restaurant = restaurante
  review.save
end
