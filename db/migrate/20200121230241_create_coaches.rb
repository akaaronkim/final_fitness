class CreateCoaches < ActiveRecord::Migration[6.0]
  def change
    create_table :coaches do |t|
      t.integer :user_id
      t.integer :workout_id
      t.integer :trainer_id
      t.timestamps
    end
  end
end
