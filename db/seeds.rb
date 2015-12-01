require 'Faker'
include Faker

total_no_of_users = 5
total_no_of_owners = 5
total_no_of_rest = 5


sample_restaurant_image = File.open("#{Rails.root}/load-tests/sbarro.jpg")

Restaurant.delete_all
LineItem.delete_all
Cart.delete_all
Checkout.delete_all
Tab.delete_all
User.delete_all
Owner.delete_all

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
    image: File.open(Dir.glob(File.join(Rails.root, 'load-tests', '*')).sample)
  )
}