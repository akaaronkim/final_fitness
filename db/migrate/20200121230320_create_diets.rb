class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.string :title
      t.string :content_type
      t.string :content_link
      t.string :description
      
      t.timestamps
    end
  end
end
