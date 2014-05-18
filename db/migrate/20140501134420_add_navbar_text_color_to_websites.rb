class AddNavbarTextColorToWebsites < ActiveRecord::Migration
  def change
  	add_column :websites, :navbar_text_color, :string, default: "#333"
  	add_column :websites, :jumbotron_text_color, :string, default: "#333"
  end
end
