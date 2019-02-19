# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


frank = User.create(email: 'frank@mail.com', password: 'password', username: 'Frank', payer: true)
nina = User.create(email: 'nina@mail.com', password: 'password', username: 'Nina')
kina = User.create(email: 'kina@mail.com', password: 'password', username: 'Kina')

Place.create(name: 'Green House', rent: 2520, users: [frank, nina, kina])
