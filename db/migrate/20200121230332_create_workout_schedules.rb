class CreateWorkoutSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_schedules do |t|

      t.timestamps
    end
  end
end
