class RemIndexSlugFromPages < ActiveRecord::Migration
  def change
  	remove_index :pages, :slug
  end
end
