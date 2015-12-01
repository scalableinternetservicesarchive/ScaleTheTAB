#********************************************
# Steps:
# 1. add gem 'faker' into gemfile
# 2. bundle install
# 3. Place the AWS credentials in 'aws.yml' & 'aws_export.sh' before doing rake db:seed
# 4. Run rake db:seed
#********************************************

require 'Faker'
include Faker

total_no_of_users = 5
total_no_of_owners = 5
total_no_of_rest = 10
total_no_of_menus = 25
total_no_of_items = 30  
total_no_of_tables = 10


Menu.delete_all
Item.delete_all
Restaurant.delete_all
LineItem.delete_all
Cart.delete_all
Checkout.delete_all
Tab.delete_all
Table.delete_all
User.delete_all
Owner.delete_all

#***************************
# Creating Users
#***************************
user_id_count = 1
total_no_of_users.times{
  user = User.create(
    id: user_id_count,
    email: Internet.email,
    password: "password"
  )
  user_id_count = user_id_count + 1
}


#***************************
# Creating Owners 
#***************************
owner_id_count = 1
total_no_of_owners.times{
  owner = Owner.create(
    id: owner_id_count,
    email: Internet.email,
    password: "password"
  )
  owner_id_count = owner_id_count + 1
}

#***************************
# Creating Restaurants
#***************************
rest_id_count = 1
total_no_of_rest.times{
  restaurant = Restaurant.create(
    id: rest_id_count,
    name: Lorem.word,
    image_url: "NULL",
    description: Lorem.sentence(3),
    address: Address.city,
    city: Address.city_prefix,
    zip_code: Address.zip_code,
    tell: PhoneNumber.phone_number,
    owner_id: rand(1..total_no_of_owners),
    image: File.open(Dir.glob(File.join(Rails.root, 'load-tests', '*')).sample)
  )
  rest_id_count = rest_id_count + 1
}

#***************************
# Creating Menus
#***************************
menu_id_count = 1
total_no_of_menus.times{
  menu = Menu.create(
    id: menu_id_count,
    restaurant_id: rand(1..total_no_of_rest),
    title: Lorem.word,
    description: Lorem.sentence(3)
  )
  menu_id_count = menu_id_count + 1
}

#***************************
# Creating Items
#***************************
item_id_count = 1
total_no_of_items.times{
  item = Item.create(
    id: item_id_count,
    title: Lorem.word,
    description: Lorem.sentence(3),
    image: File.open(Dir.glob(File.join(Rails.root, 'load-tests', '*')).sample),
    price: Commerce.price,
    menu_id: rand(1..total_no_of_menus)
  )
  item_id_count = item_id_count + 1
}

#***************************
# Creating Tables
#***************************
table_id_count = 1
total_no_of_tables.times{
  table = Table.create(
    id: table_id_count,
    name: Lorem.word,
    restaurant_id: rand(1..total_no_of_rest)
  )
  table_id_count = table_id_count + 1
}