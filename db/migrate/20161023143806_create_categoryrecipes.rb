class CreateCategoryrecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :categoryrecipes do |t|
      t.integer :category_id, :null => false
      t.integer :recipe_id, :null => false

      t.timestamps
    end
  end
end
