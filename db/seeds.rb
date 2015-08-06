# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Item.destroy_all
Item.create(name:"Burger", price: 10.00);
Item.create(name:"Wings", price: 9.50);
Item.create(name:"Fries", price: 6.00);
Item.create(name:"Sam Adams", price: 7.00);
Item.create(name:"Cosmopolitan", price: 11.00);
Item.create(name:"Martini", price: 12.00);
Item.create(name:"Vodka", price: 9.00);
Item.create(name:"Rum", price: 8.00);
