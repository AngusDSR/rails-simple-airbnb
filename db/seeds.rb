require 'faker'

puts "Clearing database..."
Flat.destroy_all

4.times do
  city = Faker::Address.city
  puts "Creating flat in #{city}."
  flat = Flat.create!(
    name: "Light & Spacious Garden Flat #{city}",
    address: Faker::Address.street_address,
    description: "A #{Faker::Verb.past_participle} feel for #{Faker::Verb.ing_form} flat. Open plan living area, large kitchen and a beautiful conservatory. Come and let it #{Faker::Verb.base} you.",
    price_per_night: 5 * rand(11..55),
    number_of_guests: rand(1..3)
  )
end

puts "All done, #{Flat.all.size} new flats added to database."
