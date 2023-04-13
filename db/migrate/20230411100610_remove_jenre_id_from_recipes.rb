class RemoveJenreIdFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :jenre_id, :integer
  end
end
