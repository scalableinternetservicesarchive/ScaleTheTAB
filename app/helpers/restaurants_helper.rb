module RestaurantsHelper

	def cache_key_for_restaurants_row(rest)
		"restaurant-#{rest.id}"
	end

	def cache_key_for_menus_row(menu)
		"menu-#{menu.id}"
	end

	def cache_key_for_tables_row(table)
		"table-#{table.id}"
	end

end
