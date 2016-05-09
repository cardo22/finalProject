# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mainUser = User.create(nick_name: "Reina", first_name: "Reina", last_name: "Nunez", card_number: "4245567834566789", email: "reina@gmail.com", login_pin: 6424, password: "password", password_confirmation: "password", role: "Admin")
subUser = User.create(nick_name: "Caro", first_name: "Carolyn", last_name: "Mendez", card_number: "3433445555555555", email: "caro@gmail.com", login_pin: 3333, password: "mypassword", password_confirmation: "mypassword")
savings_group = Group.create(name: "Nunez Savings", card: "4245567834566789", total_savings: 2000 )
members = Membership.create(user_id: 1, group_id: 1)
member2 = Membership.create(user_id: 2, group_id: 1)
goal1 = Goal.create(goal_name: "College Tuition", goal_amount: 30000, group_id: 1, user_id: 1)
