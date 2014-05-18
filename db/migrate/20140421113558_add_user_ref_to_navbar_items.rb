class AddUserRefToNavbarItems < ActiveRecord::Migration
  def change
    add_reference :navbar_items, :user, index: true
  end
end
