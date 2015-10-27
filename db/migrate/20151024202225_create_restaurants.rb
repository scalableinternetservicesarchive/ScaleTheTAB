class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.string :address
      t.string :city
      t.integer :zip_code
      t.string :tell
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
