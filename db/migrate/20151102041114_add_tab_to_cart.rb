class AddTabToCart < ActiveRecord::Migration
  def change
    add_reference :carts, :tab, index: true, foreign_key: true
  end
end
