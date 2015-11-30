class AddUserToCheckouts < ActiveRecord::Migration
  def change
    add_reference :checkouts, :user, index: true, foreign_key: true
  end
end
