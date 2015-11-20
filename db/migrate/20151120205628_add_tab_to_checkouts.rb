class AddTabToCheckouts < ActiveRecord::Migration
  def change
    add_reference :checkouts, :tab, index: true, foreign_key: true
  end
end
