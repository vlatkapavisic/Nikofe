class RemoveSlugFromWebsites < ActiveRecord::Migration
  def change
    remove_column :websites, :slug, :string
  end
end
