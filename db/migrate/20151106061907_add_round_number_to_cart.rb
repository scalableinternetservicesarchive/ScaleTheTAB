class AddRoundNumberToCart < ActiveRecord::Migration
  def change
    add_column :carts, :round_number, :integer
  end
end
