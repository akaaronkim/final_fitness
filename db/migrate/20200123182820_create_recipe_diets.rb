class CreateRecipeDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_diets do |t|
      t.integer :diet_id
      t.integer :recipe_id
      
      t.timestamps
    end
  end
end
