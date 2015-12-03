class AddRestaurantNameToCheckouts < ActiveRecord::Migration
  def change
		add_column :checkouts, :restaurant_name, :string
  end
end
