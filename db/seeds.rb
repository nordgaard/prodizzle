# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
leather = ["Belt", "Pants", "Bracelet", "Vest"]

20.times do
  product = Product.create(
  	name: Faker::Ancient.titan + " " + leather.sample,
	price: Faker::Number.between(1, 10), 
	description: Faker::Hipster.sentence(1)
	)
end