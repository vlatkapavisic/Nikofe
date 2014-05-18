class AddNavbarColorToWebsites < ActiveRecord::Migration
  def change
  	add_column :websites, :navbar_color, :string
  end
end
