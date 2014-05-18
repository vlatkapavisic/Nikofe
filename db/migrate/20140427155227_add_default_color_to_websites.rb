class AddDefaultColorToWebsites < ActiveRecord::Migration
  def change
  	change_column :websites, :navbar_color, :string, default: "#F8F8F8"
  end
end
