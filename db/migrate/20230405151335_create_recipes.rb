class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :member_id, null: false
      t.integer :jenre_id, null: false
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :protein, null: false
      t.timestamps
    end
  end
end
