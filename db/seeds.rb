require 'faker'

puts 'Clearing database...'
Flat.destroy_all

descriptions = [
  Faker::Coffee.notes,
  Faker::Company.buzzword,
  Faker::Construction.material
]

type = %w[
  Garden
  High-rise
  City-centre
  Underground
  Hippie
  Communist
]

4.times do
  city = Faker::Address.city
  puts "Creating flat in #{city}."
  Flat.create!(
    name: "#{descriptions.sample.capitalize} #{type.sample} Flat in #{city}",
    address: Faker::Address.street_address,
    description: "A #{Faker::Verb.past_participle} feel for #{Faker::Verb.ing_form} flat. Open plan living area, large kitchen and a beautiful conservatory. Come and let it #{Faker::Verb.base} you.",
    price_per_night: 5 * rand(11..55),
    number_of_guests: rand(2...6)
  )
end

puts "All done, #{Flat.all.size} new flats added to database."
