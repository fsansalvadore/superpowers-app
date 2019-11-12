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
  superpower_images = ["https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1505224959304-f6daf7fd0559_dxpogr.jpg", "https://res.cloudinary.com/dueboq0he/image/upload/v1573553358/superhero_app_seed/photo-1572883023704-baadd8d6a976_vdyimi.jpg", "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1531259683007-016a7b628fc3_mbcijc.jpg", "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1496850574977-a4607106a874_xykd4u.jpg", "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1519741347686-c1e0aadf4611_mtmynp.jpg", "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1551981878-4c70c3e64135_p2hjps.jpg", "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1534445967719-8ae7b972b1a5_wu1fag.jpg", "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1535648451240-482a0bbd6e02_o3zbez.jpg", "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1569003339405-ea396a5a8a90_hlus2s.jpg", "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1534809027769-b00d750a6bac_c2sxba.jpg"]

  superpower_attributes = []

  10.times do |index|
    superpower_attributes << {
      name: "#{Faker::Superhero.power}",
      description: Faker::Lorem.paragraph(sentence_count: 4, supplemental: false, random_sentences_to_add: 4),
      # image: superpower_images[index],
      price: rand(100..1000)
    }
  end

#   url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
# article = Article.new(title: 'NES', body: "A great console")
# article.remote_photo_url = url
# article.save

  superpower_attributes.each do |attribute, index|
    superpower = Superpower.new(attribute)
    superpower.owner = User.all.sample
    superpower.superpower_category = SuperpowerCategory.all.sample
    superpower.remote_image_url = superpower_images[index]
    superpower.save!
  end
puts "Finished creating superpowers..."

puts "Creating bookings..."
  booking_attributes = []

  10.times do
    booking_attributes << {
      start_date: Faker::Date.between(from: 10.days.ago, to: 10.days.from_now),
      end_date: Faker::Date.between(from: 11.days.from_now, to: 20.days.from_now)
    }
  end

  booking_attributes.each do |attribute|
    booking = Booking.new(attribute)
    booking.rentee = User.all.sample
    booking.superpower = Superpower.all.sample
    booking.save!
  end
puts "Finished creating bookings..."

