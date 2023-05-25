# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Destroying previous data...'
Movie.destroy_all

50.times do |i|
  Movie.create(title: Faker::Movie.title, overview: Faker::Movies::PrincessBride.quote, poster_url: 'https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg',
               rating: rand(1.0..10.0))
end

puts '...Movies created!'
