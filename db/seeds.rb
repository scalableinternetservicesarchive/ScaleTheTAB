# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# restaurant = Restaurant.create({name: 'Rest1', description: 'Rest1Desc'})

# restaurant.tables.create([{name: 'Table1'},{name: 'Table2'}])

# menu = restaurant.menus.create({title: 'menu1'})

# menu.items.create([{title: 'item1',price: 9.99},
# 	{title: 'item2', price: 12.99},
# 	{title: 'item3', price: 12.99},
# 	{title: 'item4', price: 12.99},
# 	{title: 'item5', price: 12.99}])



# Owner.create({email: 'o1@seed.com' , password: '12345678' , password_confirmation: '12345678'})
# Owner.create({email: 'o2@seed.com' , password: '12345678' , password_confirmation: '12345678'})
# Owner.create({email: 'o3@seed.com' , password: '12345678' , password_confirmation: '12345678'})
# Owner.create({email: 'o4@seed.com' , password: '12345678' , password_confirmation: '12345678'})
# Owner.create({email: 'o5@seed.com' , password: '12345678' , password_confirmation: '12345678'})


# User.create({email: 'u1@seed.com' , password: '12345678' , password_confirmation: '12345678'})
# User.create({email: 'u2@seed.com' , password: '12345678' , password_confirmation: '12345678'})
# User.create({email: 'u3@seed.com' , password: '12345678' , password_confirmation: '12345678'})
# User.create({email: 'u4@seed.com' , password: '12345678' , password_confirmation: '12345678'})
# User.create({email: 'u5@seed.com' , password: '12345678' , password_confirmation: '12345678'})


item_num = 0
Menu.delete_all
Item.delete_all
Owner.delete_all
Restaurant.delete_all
User.delete_all

#Item.delete_all
for i in 0..1000 do
	owner = Owner.create({email: "o#{i}@seed.com" , password: '12345678' , password_confirmation: '12345678'})
	restaurant = Restaurant.create({name: "Rest #{i}", description: "Rest #{i} Desc" , address: '123 Somewhere' , 
		city: 'Los Angeles' , zip_code: '90001' , tell: "8001112233" , owner_id: owner.id})
	restaurant.tables.create([{name: 'Table1'},{name: 'Table2'}])

	menu = restaurant.menus.create({title: 'menu1'})

	for i in 0..5 do
	menu.items.create([{title: "item #{i}",price: 9.99}])
	end

end


for u in 0..1000 do
	User.create({email: "u#{u}@seed.com" , password: '12345678' , password_confirmation: '12345678'})
end



