class RemIndexFromNavitems < ActiveRecord::Migration
  def change
  	remove_index :navbar_items, :name
  end
end
