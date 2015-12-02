module ItemsHelper

	def cache_key_for_items_row(item)
		"item-#{item.id}-#{item.updated_at}-#{current_user}-#{current_owner}"
	end

end
