class AlterColumnCheckoutsAmount < ActiveRecord::Migration
  def up
		change_column :checkouts, :amount, :decimal, :precision => 8, :scale => 2
  end

	def down
		change_column :checkouts, :amount, :integer
	end
end
