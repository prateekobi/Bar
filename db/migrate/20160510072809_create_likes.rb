class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :bar_id, :recipe_id
      t.timestamps
    end
  end
end
