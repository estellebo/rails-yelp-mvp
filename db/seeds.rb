require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

5.times do
  name = Faker::Name.name
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.cell_phone
  category = ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  restaurant = Restaurant.new(name: name, address: address, phone_number: phone_number, category: category)
  restaurant.save
  10.times do
    content = Faker::Lorem.paragraph
    rating = [0, 1, 2, 3, 4, 5].sample
    review = Review.new(content: content, rating: rating)
    review.restaurant = restaurant
    review.save
  end
end

puts 'Finished!'
