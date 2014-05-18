class AddNameIndexToNavbarItems < ActiveRecord::Migration
  def change
  	add_index :navbar_items, :name, :unique => true
  end
end
