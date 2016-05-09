# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mainUser = User.create(first_name: "Reina", last_name: "Nunez", card_number: "4245567834566789", email: "reina@gmail.com", login_pin: 6424, password: "password", password_confirmation: "password", role: "Admin")
