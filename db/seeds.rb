# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'json'
require 'open-uri'

puts 'Destroying previous data...'
Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
movie_serialized = URI.open(url).read
movie = JSON.parse(movie_serialized)

50.times do |i|
  movie['results'].each do |result|
    Movie.create(title: result['title'], overview: result['overview'], poster_url: result['poster_path'],
                 rating: result['vote_average'])
  end
end
puts '...Movies created!'
