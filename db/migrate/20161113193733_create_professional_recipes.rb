class CreateProfessionalRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :professional_recipes do |t|
      t.string :nombre
      t.string :description
      t.integer :reviews

      t.timestamps
    end
  end
end
