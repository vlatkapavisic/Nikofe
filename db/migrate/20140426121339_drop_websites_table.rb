class DropWebsitesTable < ActiveRecord::Migration
  def change
  	drop_table :websites
  end
end

