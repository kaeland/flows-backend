# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Plants
Plant.create(name: "Big Creek")

# Create Addresses
5.times do 
  Address.create(street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip, plant_id: 1)
end

# Create Machines
Machine.create(name: "Temp Sensor", plant_id: 1)
Machine.create(name: "Flow Sensor", plant_id: 1)

# Create Users without manager_id
# Can Set a user as a manager on the frontend
5.times do 
  User.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    username: Faker::Team.creature, 
    password_digest: BCrypt::Password.create("password"),  
    bio: Faker::Lorem.sentence(3), 
    avatar: Faker::Avatar.image, 
    plant_id: 1
    )
end

# Create Shifts
Shift.create(name: "Day")

# Create UserShifts
UserShift.create(user_id: 1, shift_id: 1)

# Create Rounds
Round.create(time_of_day: "7am", plant_id: 1, shift_id: 1)
Round.create(time_of_day: "11am", plant_id: 1, shift_id: 1)
Round.create(time_of_day: "3pm", plant_id: 1, shift_id: 1)

# Create MachineRounds
MachineRound.create(machine_id: 1, round_id: 1, shift_id: 1, data: 23)
MachineRound.create(machine_id: 1, round_id: 2, shift_id: 1, data: 23)
MachineRound.create(machine_id: 1, round_id: 3, shift_id: 1, data: 23)
MachineRound.create(machine_id: 2, round_id: 1, shift_id: 1, data: 23)
MachineRound.create(machine_id: 2, round_id: 2, shift_id: 1, data: 23)
MachineRound.create(machine_id: 2, round_id: 3, shift_id: 1, data: 23)









# <--- Past seeds --->
# Create Data Points
# 100.times do
#   Datum.create(
#     name: "water level",
#     payload: rand(0..100), 
#     machine_id: 1
#   )
# end

# 100.times do
#   Datum.create(
#     name: "temperature",
#     payload: rand(0..100), 
#     machine_id: 2
#   )
# end

# 100.times do
#   Datum.create(
#     name: "water flow rate",
#     payload: rand(0..100), 
#     machine_id: 3
#   )
# end




