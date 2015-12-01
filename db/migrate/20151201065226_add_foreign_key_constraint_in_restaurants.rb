class AddForeignKeyConstraintInRestaurants < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :owner_id
  	add_reference :restaurants, :owner, index: true, foreign_key: true
  end
end
