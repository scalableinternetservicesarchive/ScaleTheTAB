total_no_of_users = 1000
total_no_of_owners = 1000
total_no_of_rest = 1000
total_no_of_menus = 2000
total_no_of_items = 1000
total_no_of_tables = 2




puts "Started creating users...."
user_id_count = 2
total_no_of_users.times{
  user = User.create(
    id: user_id_count,
    email: Faker::Internet.email,
    password: "password"
  )
  user_id_count = user_id_count + 1
}
user = User.create(
    id: 1,
    email: "u1@seed.com",
    password: "password"
  )

puts "Finished creating users...."


puts "Started creating owners...."
owner_id_count = 2
total_no_of_owners.times{
  owner = Owner.create(
    id: owner_id_count,
    email: Faker::Internet.email,
    password: "password"
  )
  owner_id_count = owner_id_count + 1
}
owner = Owner.create(
    id: 1,
    email: "o1@seed.com",
    password: "password"
  )
puts "Finished creating users...."


puts "Started creating Restaurant 1...."
restaurant = Restaurant.create(
    id: 1,
    name: Faker::Lorem.word,
    image_url: "NULL",
    description: Faker::Lorem.sentence(3),
    address: Faker::Address.city,
    city: Faker::Address.city_prefix,
    zip_code: Faker::Address.zip_code,
    tell: Faker::PhoneNumber.phone_number,
    owner_id: rand(1..total_no_of_owners),
    image: File.open(Dir.glob(File.join(Rails.root, 'load-tests', '*')).sample)
  )

rest_id_count = 2

puts "Creating remaining restaurants...."
total_no_of_rest.times{
  restaurant = Restaurant.create(
    id: rest_id_count,
    name: Faker::Lorem.word,
    image_url: "NULL",
    description: Faker::Lorem.sentence(3),
    address: Faker::Address.city,
    city: Faker::Address.city_prefix,
    zip_code: Faker::Address.zip_code,
    tell: Faker::PhoneNumber.phone_number,
    owner_id: rand(1..total_no_of_owners),
    image_file_name: "placeholder.jpg",
    image_content_type: "image/jpeg",
    image_file_size: "6386"
    
  )
  
  puts restaurant.inspect
  menu = Menu.create(
    id: rest_id_count,
    restaurant_id: rest_id_count,
    title: Faker::Lorem.word,
    description: Faker::Lorem.sentence(3)
  )
  puts menu.inspect

  item = Item.create(
    id: rest_id_count,
    menu_id: rest_id_count,
    title: Faker::Lorem.word,
    description: Faker::Lorem.sentence(3),
    image_file_name: "placeholder.jpg",
    image_content_type: "image/jpeg",
    image_file_size: "6386",
    price: Faker::Commerce.price
  )


  table_id_count = 1
  total_no_of_tables.times{
  table = Table.create(
    id: rest_id_count*10+table_id_count,
    name: Faker::Lorem.word,
    restaurant_id: rest_id_count
  )
  puts table.inspect
  table_id_count = table_id_count + 1

}
  rest_id_count = rest_id_count + 1
}


puts "Finished creating restaurants...."


puts "Started creating extra menus...."
menu_id_count = total_no_of_rest + 2
total_no_of_menus.times{
  menu = Menu.create(
    id: menu_id_count,
    restaurant_id: rand(2..total_no_of_rest),
    title: Faker::Lorem.word,
    description: Faker::Lorem.sentence(3)
  )
menu_id_count = menu_id_count + 1
}
menu_id_count = menu_id_count - 1 
puts "Finished creating menus...."


puts "Started creating items...."
item_id_count = total_no_of_rest + 2
total_no_of_items.times{
  item = Item.create(
    id: item_id_count,
    title: Faker::Lorem.word,
    description: Faker::Lorem.sentence(3),
    image_file_name: "placeholder.jpg",
    image_content_type: "image/jpeg",
    image_file_size: "6386",

    price: Faker::Commerce.price,
    menu_id: rand(2..menu_id_count)

  )
  item_id_count = item_id_count + 1
}
puts "Finished creating items...."