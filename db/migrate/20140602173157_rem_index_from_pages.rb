class RemIndexFromPages < ActiveRecord::Migration
  def change
  	remove_index :pages, :title
  end
end
