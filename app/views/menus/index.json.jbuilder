json.array!(@menus) do |menu|
  json.extract! menu, :id, :restaurant_id, :title, :description
  json.url menu_url(menu, format: :json)
end
