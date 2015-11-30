# <<<<<<< HEAD
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)

# item_num = 0
# Menu.delete_all
# Item.delete_all
# Owner.delete_all
# Restaurant.delete_all
# User.delete_all


# for i in 0..10 do
# 	owner = Owner.create({email: "o#{i}@seed.com" , password: '12345678' , password_confirmation: '12345678'})
# 	restaurant = Restaurant.create({name: "Rest #{i}", description: "Rest #{i} Desc" , address: '123 Somewhere' , 
# 		city: 'Los Angeles' , zip_code: '90001' , tell: "8001112233" , owner_id: owner.id})
# 	restaurant.tables.create([{name: 'Table1'},{name: 'Table2'}])
# 	menu = restaurant.menus.create({title: 'menu1'})
# 	for i in 0..5 do
# 	menu.items.create([{title: "item #{item_num}",price: 9.99}])
# 	item_num = item_num + 1
# 	end
# end


# for u in 0..10 do
# 	User.create({email: "u#{u}@seed.com" , password: '12345678' , password_confirmation: '12345678'})
# end



# =======
Owner.create!([
  {email: "o1@o.com", password: "12345678", password_confirmation: "12345678" , reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-11-30 04:27:22", last_sign_in_at: "2015-11-30 04:27:22", current_sign_in_ip: "::1", last_sign_in_ip: "::1"}
])
User.create!([
  {email: "c1@c.com", password: "12345678", password_confirmation: "12345678" , reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-11-30 04:28:29", last_sign_in_at: "2015-11-30 04:28:29", current_sign_in_ip: "::1", last_sign_in_ip: "::1"}
])
Cart.create!([
  {tab_id: nil, round_number: 1}
])
Item.create!([
  {title: "Sandwich", description: "Yummy", image_url: nil, price: "8.75", menu_id: 1, image_file_name: "ovenroasted_subway.jpeg", image_content_type: "image/jpeg", image_file_size: 8774, image_updated_at: "2015-11-30 04:30:45"},
  {title: "Pizza", description: "Yu", image_url: nil, price: "5.98", menu_id: 2, image_file_name: "item2.jpg", image_content_type: "image/jpeg", image_file_size: 202565, image_updated_at: "2015-11-30 04:35:38"}
])
Menu.create!([
  {restaurant_id: 1, title: "Appetizers", description: "Yummy"},
  {restaurant_id: 3, title: "Appetizers", description: "Yummy"}
])
Restaurant.create!([
  {name: "Subway", image_url: nil, description: "Fast Food", address: "Westwood", city: "LA", zip_code: 90024, tell: "111111111", owner_id: 1, image_file_name: "subway.jpg", image_content_type: "image/jpeg", image_file_size: 957909, image_updated_at: "2015-11-30 04:27:54"},
  {name: "Sbarro", image_url: nil, description: "Pizza", address: "UCLA Ackerman Union", city: "LOs Angeles", zip_code: nil, tell: "", owner_id: 1, image_file_name: "sbarro.jpg", image_content_type: "image/jpeg", image_file_size: 4953526, image_updated_at: "2015-11-30 04:31:59"},
  {name: "Sbarro", image_url: nil, description: "Pizza", address: "UCLA Ackerman Union", city: "LA", zip_code: 90024, tell: "1234567890", owner_id: 1, image_file_name: "sbarro.jpg", image_content_type: "image/jpeg", image_file_size: 4953526, image_updated_at: "2015-11-30 04:32:18"}
])
Tab.create!([
  {user_id: 1, table_id: nil}
])
Table.create!([
  {name: "Table1", restaurant_id: 1},
  {name: "t1", restaurant_id: 3}
])
# >>>>>>> dev
