json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :image_url, :description, :address, :city, :zip_code, :tell, :owner_id
  json.url restaurant_url(restaurant, format: :json)
end
