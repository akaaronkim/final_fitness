class CreatePumps < ActiveRecord::Migration[6.0]
  def change
    create_table :pumps do |t|
      t.integer :user_id
      t.integer :workout_id
      t.integer :diet_id
      t.timestamps
    end
  end
end
