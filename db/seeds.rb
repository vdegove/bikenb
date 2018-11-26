# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

augustin = User.new(email: "cousinaug01@hotmail.fr")
augustin.password = "123456"
augustin.save!

laura = User.new(email: "laura.ducosfilippi@gmail.com")
laura.password = "654321"
laura.save!

puts "Users Augustin and Laura created!"

velo = Bike.new(name: "Douze V2 de Laura", description: "Un vélo cargo pour transporter plein de choses", price_per_day: "1500", address: "14 rue Crespin du Gast, 75009 Paris")
velo.user = laura
velo.save!

puts "One bike created and assignated to the owner Laura"

