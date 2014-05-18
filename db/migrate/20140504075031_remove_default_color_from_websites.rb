class RemoveDefaultColorFromWebsites < ActiveRecord::Migration
  def change
  	change_column :websites, :navbar_text_color, :string, default: nil
  	change_column :websites, :jumbotron_text_color, :string, default: nil
  end
end
