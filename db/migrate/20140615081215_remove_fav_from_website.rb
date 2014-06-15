class RemoveFavFromWebsite < ActiveRecord::Migration
  def change
  	remove_column :websites, :favicon_file_name, :string
  	remove_column :websites, :favicon_content_type, :string
  	remove_column :websites, :favicon_file_size, :integer
  	remove_column :websites, :favicon_updated_at, :datetime
  	remove_column :websites, :navitems_count, :integer
  	remove_column :pages, :pages_count, :integer
  	remove_column :pages, :navbar_position, :integer
  	remove_column :navbar_items, :navbar_position, :integer
  end
end
