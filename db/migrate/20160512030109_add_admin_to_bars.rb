class AddAdminToBars < ActiveRecord::Migration
  def change
    add_column :bars, :admin, :boolean, default: false
  end
end
