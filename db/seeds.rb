#Cleaning database
puts "Destroying bookings..."
Booking.destroy_all

puts "Destroying superpowers..."

puts "Deleting user uploaded photos from Cloudinary"
Superpower.all.each do |superpower|
  superpower.image.file.delete
end

Superpower.destroy_all

puts "Destroying superpower categories..."
SuperpowerCategory.destroy_all

puts "Destroying users..."
User.destroy_all

#Creating entries
superpower_categories = [
  {name: "Speedy fingers", icon: "fingering.png"},
  {name: "Immortality", icon: "immortality.png"},
  {name: "Mind control", icon: "mind_control.png"},
  {name: "Super IQ", icon: "super_intelligence.png"},
  {name: "Time travel", icon: "time_travel.png"},
  {name: "Teleportation", icon: "teleportation.png"},
  {name: "Manipulate time", icon: "temp_manipulation.png"},
  {name: "Perception", icon: "perception.png"},
  {name: "X-ray vision", icon: "xray.png"},
  {name: "Speed", icon: "speed.png"},
]

puts "Creating superpower categories..."
  superpower_categories.each do |category|
    SuperpowerCategory.create!(category)
  end
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

  # Creating custom users
  User.create!(email: "a@b.com", first_name: "Axel", last_name: "Abildtrup", password: "123456")
  User.create!(email: "super@powers.com", first_name: "Jack", last_name: "Fitzsimons", password: "123456")
  User.create!(email: "f.sansalvadore@gmail.com", first_name: "Francesco", last_name: "Sansalvadore", password: "123456")
  User.create!(email: "lh@gmail.com", first_name: "Lars", last_name: "Houbak", password: "123456")

puts "Finished creating users..."

puts "Creating superpowers..."

  superpower_names = [
    "Improve your fingering",
    "Super strength",
    "Become the Joker",
    "Become the Batman",
    "Travel through time",
    "Teleport with power woman",
    "Manipulate time",
    "See better underwater",
    "X-ray vision",
    "Spidey sense"
  ]

  superpower_images = [
    "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1505224959304-f6daf7fd0559_dxpogr.jpg",
    "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1519741347686-c1e0aadf4611_mtmynp.jpg",
    "https://res.cloudinary.com/dueboq0he/image/upload/v1573745508/superhero_app_seed/joker_vgtdd9.jpg",
    "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1531259683007-016a7b628fc3_mbcijc.jpg",
    "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1496850574977-a4607106a874_xykd4u.jpg",
    "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1551981878-4c70c3e64135_p2hjps.jpg",
    "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1534445967719-8ae7b972b1a5_wu1fag.jpg",
    "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1535648451240-482a0bbd6e02_o3zbez.jpg",
    "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1569003339405-ea396a5a8a90_hlus2s.jpg",
    "https://res.cloudinary.com/dueboq0he/image/upload/v1573553357/superhero_app_seed/photo-1534809027769-b00d750a6bac_c2sxba.jpg"
  ]

  superpower_attributes = []

  10.times do |index|
    superpower_attributes << {
      name: superpower_names[index],
      description: Faker::Lorem.paragraph(sentence_count: 4, supplemental: false, random_sentences_to_add: 4),
      price: rand(100..1000)
    }
  end

  superpower_attributes.each_with_index do |attribute, index|
    superpower = Superpower.new(attribute)
    superpower.owner = [
      User.where(email: "a@b.com")[0],
      User.where(email: "super@powers.com")[0],
      User.where(email: "f.sansalvadore@gmail.com")[0],
      User.where(email: "lh@gmail.com")[0]
    ].sample

    superpower.superpower_category = SuperpowerCategory.where(name: superpower_categories[index][:name])[0]
    superpower.remote_image_url = superpower_images[index]
    superpower.save!
  end
puts "Finished creating superpowers..."

puts "Creating bookings..."
  booking_attributes = []

  10.times do
    booking_attributes << {
      start_date: Faker::Date.between(from: 10.days.ago, to: 10.days.from_now),
      end_date: Faker::Date.between(from: 11.days.from_now, to: 20.days.from_now),
      price: 100
    }
  end

  booking_attributes.each do |attribute|
    booking = Booking.new(attribute)
    booking.rentee = [
      User.where(email: "a@b.com")[0],
      User.where(email: "super@powers.com")[0],
      User.where(email: "f.sansalvadore@gmail.com")[0],
      User.where(email: "lh@gmail.com")[0]
    ].sample

    booking.superpower = Superpower.all.sample
    booking.save!
  end
puts "Finished creating bookings..."

