module MenusHelper

	def cache_key_for_menu_form(menu)
		"menu-#{menu.id}-#{menu.updated_at}"
	end

end
