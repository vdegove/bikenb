# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

renter = User.new(email: "renter@example.com")
renter.password = "123456"
renter.save!

owner = User.new(email: "owner@example.com")
owner.password = "654321"
owner.save!

puts "Users renter and owner created!"

velo = Bike.new(
  name: "Douze V2",
  description: "Un vélo cargo pour transporter plein de choses",
  price_per_day: "1500",
  address: "14 rue Crespin du Gast, 75009 Paris")
velo.remote_photo_url = "http://res.cloudinary.com/dw7nokc0j/image/upload/v1543250831/g2mlshdc2k68mwrin04z.jpg"

velo.user = owner
velo.save!

velo_2 = Bike.new(
  name: "Vélo de ville",
  description: "Un vélo de ville avec des garde-boues",
  price_per_day: "1200",
  address: "16 Villa Gaudelet, 75009 Paris")
velo_2.remote_photo_url = "http://res.cloudinary.com/dw7nokc0j/image/upload/v1543251227/tta6fyivnnandj81rsvz.jpg"
velo_2.user = owner
velo_2.save!

puts "Two bikes created and assignated to the owner"

