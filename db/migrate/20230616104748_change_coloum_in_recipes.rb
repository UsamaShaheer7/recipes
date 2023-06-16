class ChangeColoumInRecipes < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :email, :description # rename_column(table_name, column_name, new_column_name)
    change_column :recipes, :description, :text # change_column(table_name, column_name, type)
  end
end
