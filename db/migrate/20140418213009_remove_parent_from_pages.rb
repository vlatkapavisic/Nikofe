class RemoveParentFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :navbar_item_id, :string
  end
end
