class RemoveColorsFromWebstes < ActiveRecord::Migration
  def change
  	remove_column :websites, :navbar_text_color, :string
  	remove_column :websites, :jumbotron_text_color, :string
  end
end
