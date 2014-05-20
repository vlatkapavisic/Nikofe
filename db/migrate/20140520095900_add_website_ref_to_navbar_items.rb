class AddWebsiteRefToNavbarItems < ActiveRecord::Migration
  def change
    add_reference :navbar_items, :website, index: true
  end
end
