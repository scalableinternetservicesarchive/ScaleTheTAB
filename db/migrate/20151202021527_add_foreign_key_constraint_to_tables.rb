class AddForeignKeyConstraintToTables < ActiveRecord::Migration
  def change
  	remove_column :tables, :restaurant_id
  	add_reference :tables, :restaurant, index: true, foreign_key: true
  end
end
