class AddBarIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :bar_id, :integer
  end
end
