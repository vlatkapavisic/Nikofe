class AddHomeCoverToWebsites < ActiveRecord::Migration
  def change
  	add_attachment :websites, :home_cover
  end
end
