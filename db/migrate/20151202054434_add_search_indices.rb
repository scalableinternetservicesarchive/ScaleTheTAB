class AddSearchIndices < ActiveRecord::Migration
  def change
  	execute %Q{
      ALTER TABLE restaurants ENGINE = MYISAM;
    }
  	add_index :restaurants, :name, type: :fulltext
  	add_index :restaurants, :address, type: :fulltext
  	add_index :restaurants, :zip_code, using: 'btree'
  end
end
