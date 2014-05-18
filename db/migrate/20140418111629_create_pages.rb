class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :navbar_item_id
      t.string :slug

      t.timestamps
    end
  end
end
