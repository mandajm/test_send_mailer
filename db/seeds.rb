# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#======================================================================================
# 5.times do |i|
#  user = User.create(last_name:"Féfé#{i}", email: "féfé#{i}@yopmail.com")
# end

# 3.times do |i|
#     event = Event.create(user_id:"#{i + 1}", start_date: 12-03-2019, duration: 30, description: "jour j - #{i} pour etre d'accord", price: 500, location: "voiture numero #{i}")
# end

attendance = Attendance.create(
    event_id:1,
    user_id:2,
    stripe_customer_id: 1
    )