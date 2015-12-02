module RestaurantsHelper

	def cache_key_for_restaurant_page(rest)
		"restaurant-#{rest.id}-#{rest.updated_at}-#{user_signed_in?}-#{owner_signed_in?}"
	end

	def cache_key_for_restaurants_row(rest)
		"restaurant-#{rest.id}-#{rest.updated_at}"
	end

	def cache_key_for_restaurants_form(rest)
		"restaurant-#{rest.id}-#{rest.updated_at}"
	end

	def cache_key_for_menus_row(menu)
		key = "menu-#{menu.id}-#{menu.updated_at}"		
		menu.items.each do |item|
			key += cache_key_for_items_row(item)
		end
		key
	end
	
	def cache_key_for_items_row(item)
		"item-#{item.id}-#{item.updated_at}-#{user_signed_in?}-#{owner_signed_in?}"
	end

	def cache_key_for_tables_row(table)
		"table-#{table.id}-#{table.updated_at}"
	end

end
