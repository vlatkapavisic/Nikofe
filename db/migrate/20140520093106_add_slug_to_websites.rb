class AddSlugToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :slug, :string
  end
end
