# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



restaurant = Restaurant.create({name: 'Rest1', description: 'Rest1Desc'})

restaurant.tables.create([{name: 'Table1'},{name: 'Table2'}])

menu = restaurant.menus.create({title: 'menu1'})

menu.items.create([{title: 'item1',price: 9.99},
	{title: 'item2', price: 12.99},
	{title: 'item3', price: 12.99},
	{title: 'item4', price: 12.99},
	{title: 'item5', price: 12.99}])