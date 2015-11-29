# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'Faker'
include Faker

LineItem.delete_all
Item.delete_all

# 1.times{
# 	item = Item.create(
# 		title: Company.name,
# 		description: Lorem.paragraphs,
# 		image_url: Company.bs,
# 		price: Number.decimal(2),
# 		menu_id: rand(1..10),
# 		image_file_name: Company.name
# 	)
# 	puts item.inspect
# }