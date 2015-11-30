# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'Faker'
include Faker

Restaurant.delete_all
LineItem.delete_all
Cart.delete_all
Checkout.delete_all
Tab.delete_all
User.delete_all
Owner.delete_all


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

total_no_of_users = 5
total_no_of_owners = 5
total_no_of_rest = 5


sample_restaurant_image = File.open("#{Rails.root}/load-tests/res4.jpg")

#***************************
# Creating Users
#***************************
total_no_of_users.times{
  user = User.create(
    email: Internet.email,
    password: "password"
  )
}

#***************************
# Creating Owners 
#***************************
total_no_of_owners.times{
  owner = Owner.create(
    email: Internet.email,
    password: "password"
  )
}

#***************************
# Creating Restaurants
#***************************
total_no_of_rest.times{
  restaurant = Restaurant.create(
    name: Company.name,
    image_url: "NULL",
    description: Lorem.sentence(3),
    address: Address.city,
    city: Address.city_prefix,
    zip_code: Address.zip_code,
    tell: PhoneNumber.phone_number,
    owner_id: rand(total_no_of_owners),
    image_file_name: "res4.jpg"
  )
}
