class AddPasswordDigestToBar < ActiveRecord::Migration
  def change
    add_column :bars, :password_digest, :string
  end
end
