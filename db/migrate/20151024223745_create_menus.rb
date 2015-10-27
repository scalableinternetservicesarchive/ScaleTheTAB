class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :restaurant_id
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
