class AddVideoToPages < ActiveRecord::Migration
  def change
    add_column :pages, :video_code, :string
  end
end
