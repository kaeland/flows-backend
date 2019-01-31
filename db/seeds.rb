# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Addresses
5.times do 
  Address.create(
    street: Faker::Address.street_address, 
    city: Faker::Address.city, 
    state: Faker::Address.state, 
    zip: Faker::Address.zip, 
    plant_id: rand(1..3) 
    )
end

# Create Data Points
100.times do
  Datum.create(
    name: "water level",
    payload: rand(0..100), 
    machine_id: 1
  )
end

100.times do
  Datum.create(
    name: "temperature",
    payload: rand(0..100), 
    machine_id: 2
  )
end

100.times do
  Datum.create(
    name: "water flow rate",
    payload: rand(0..100), 
    machine_id: 3
  )
end

# Create Machines
Machine.create(name: "Water Meter", plant_id: 1, round_id: 1)
Machine.create(name: "Temp Sensor", plant_id: 1, round_id: 1)
Machine.create(name: "Water Meter", plant_id: 1, round_id: 1)

# Create Plants
Plant.create(name: "Big Creek")

# Create Rounds
Round.create(name: "Day-First", time_of_day: Tod::TimeOfDay.parse "7am")
Round.create(name: "Day-Second", time_of_day: Tod::TimeOfDay.parse "11am")
Round.create(name: "Day-Third", time_of_day: Tod::TimeOfDay.parse "3pm")
# Round.create(name: "Night-First", time_of_day: Tod::TimeOfDay.parse "noon")
# Round.create(name: "Night-Second", time_of_day: Tod::TimeOfDay.parse "noon")
# Round.create(name: "Night-Third", time_of_day: Tod::TimeOfDay.parse "noon")

