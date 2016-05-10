class CreateBar < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :barname
      t.string :email
      t.timestamps
    end
  end
end
