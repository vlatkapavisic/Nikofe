class AddWebsiteRefToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :website, index: true
  end
end
