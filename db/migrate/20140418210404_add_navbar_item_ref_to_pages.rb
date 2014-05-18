class AddNavbarItemRefToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :navbar_item, index: true
  end
end
