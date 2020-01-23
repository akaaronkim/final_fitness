class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :url
      t.string :img
      t.string :address
      t.string :phone
      t.string :bio
      
      t.timestamps
    end
  end
end
