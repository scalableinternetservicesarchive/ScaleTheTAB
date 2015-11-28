class AddTableToTabs < ActiveRecord::Migration
  def change
    add_reference :tabs, :table, index: true, foreign_key: true
  end
end
