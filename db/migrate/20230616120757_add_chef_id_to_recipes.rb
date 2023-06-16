class AddChefIdToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :chef_id, :integer # add chef_id column to recipes table
  end
end
