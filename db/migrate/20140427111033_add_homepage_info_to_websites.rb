class AddHomepageInfoToWebsites < ActiveRecord::Migration
  def change
  	add_column :websites, :home_title, :string
  	add_column :websites, :home_body, :text
  end
end
