#Cleaning database
puts "Destroying bookings..."
Booking.destroy_all

puts "Destroying superpowers..."
Superpower.destroy_all

puts "Destroying superpower categories..."
SuperpowerCategory.destroy_all

puts "Destroying users..."
User.destroy_all

#Creating entries
puts "Creating superpower categories..."
  SuperpowerCategory.create!(name: "Enhance", icon: "enhance.png")
  SuperpowerCategory.create!(name: "Speed", icon: "speed.png")
  SuperpowerCategory.create!(name: "X-ray vision", icon: "x-ray.png")
  SuperpowerCategory.create!(name: "Speedy fingers", icon: "speedy_fingers.png")
  SuperpowerCategory.create!(name: "Teleportation", icon: "teleportation.png")
  SuperpowerCategory.create!(name: "Temporal manipulation", icon: "temporal_manipulation.png")
  SuperpowerCategory.create!(name: "Super intelligence", icon: "super_intelligence.png")
  SuperpowerCategory.create!(name: "Mind control", icon: "mind_control.png")
  SuperpowerCategory.create!(name: "Time travel", icon: "time_travel.png")
  SuperpowerCategory.create!(name: "Immortality", icon: "immortality.png")
puts "Finished creating superpower categories..."

puts "Creating users..."
  10.times do
    User.create!(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: Faker::String.random(length: [6, 12])
      )
  end
puts "Finished creating users..."


puts "Creating superpowers..."
puts "Finished creating superpowers..."


puts "Creating bookings..."
puts "Finished creating bookings..."





# flat_attributes = []

# adjectives = %W(Lovely Charming Nice Beautiful Ugly Nasty Filthy Dirty Wonderful Inspirational)

# puts 'Creating 10 valid flats...'
# 10.times do
#   flat_attributes << {
#     name: "#{adjectives.sample} apartment in #{Faker::Address.city}",
#     address: Faker::Address.full_address,
#     description: Faker::Lorem.paragraph(sentence_count: 10, supplemental: false, random_sentences_to_add: 4),
#     price_per_night: rand(100...1000),
#     number_of_guests: rand(0..10),
#     picture_url: "https://source.unsplash.com/800x600/?apartment,#{adjectives.sample}"
#   }
# end

# Flat.create!(flat_attributes)
# puts 'Finished creating 10 valid flats!'
