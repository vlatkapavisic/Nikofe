class AddUserIndexToPages < ActiveRecord::Migration
	def change
    	add_index :pages, :user_id
  	end
end
