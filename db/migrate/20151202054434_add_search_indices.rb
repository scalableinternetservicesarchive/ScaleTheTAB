class AddSearchIndices < ActiveRecord::Migration
  def change
  	add_index :restaurants, :name, type: :fulltext
  	add_index :restaurants, :address, type: :fulltext
  	add_index :restaurants, :zip_code, using: 'btree'
  end
end
