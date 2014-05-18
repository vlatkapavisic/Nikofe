class CreateNavbarItems < ActiveRecord::Migration
  def change
    create_table :navbar_items do |t|
      t.string :name

      t.timestamps
    end
  end
end
