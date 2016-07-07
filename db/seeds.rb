# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create!({name: "User", email: "user@user.com", password: "password"})
board1 = Board.create!(name: "Gryppers", user_id: 1)
design1= Design.create!(board_id: board1.id, spoonflower_id: 2365210, design_name:"Gryppers PRO")
cart1 = Cart.create!(user_id: user1.id)
