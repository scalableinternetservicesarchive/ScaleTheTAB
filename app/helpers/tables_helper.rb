module TablesHelper

  def cache_key_for_tables_form(table)
		"table-#{table.id}-#{table.updated_at}"
	end

end
