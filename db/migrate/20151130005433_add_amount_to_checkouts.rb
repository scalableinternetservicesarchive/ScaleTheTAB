class AddAmountToCheckouts < ActiveRecord::Migration
  def change
		add_column :checkouts, :amount, :integer
  end
end
