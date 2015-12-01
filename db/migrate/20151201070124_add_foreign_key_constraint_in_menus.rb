class AddForeignKeyConstraintInMenus < ActiveRecord::Migration
  def change
  	remove_column :menus, :restaurant_id
  	add_reference :menus, :restaurant, index: true, foreign_key: true
  end
end
