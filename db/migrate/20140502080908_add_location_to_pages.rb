class AddLocationToPages < ActiveRecord::Migration
  def change
  	add_column :pages, :latitude, :float
  	add_column :pages, :longitude, :float
  	add_column :pages, :address, :string
  end
end
