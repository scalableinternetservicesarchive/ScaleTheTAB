class AddForeignKeyConstraintInItems < ActiveRecord::Migration
  def change
  	remove_column :items, :menu_id
  	add_reference :items, :menu, index: true, foreign_key: true
  end
end
