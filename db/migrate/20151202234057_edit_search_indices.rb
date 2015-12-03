class EditSearchIndices < ActiveRecord::Migration
  def change
  	remove_index :restaurants, :address
  	add_index :restaurants, :city, type: :fulltext
  end
end
