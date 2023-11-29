# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning database...'
Flat.destroy_all

puts 'Generating 30 flats...'
30.times do |flat|
  flat = Flat.create!(
  name: Faker::Address.street_name,
  address: Faker::Address.street_address,
  description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
  price_per_night: Faker::Number.between(from: 34, to: 345),
  number_of_guests: Faker::Number.between(from: 1, to: 6)
  )
  puts "Created #{flat.name}"
end
puts "Finished!"
