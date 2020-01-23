class AddTrainerIdToCoaches < ActiveRecord::Migration[6.0]
  def change
    add_column :coaches, :trainer_id
  end
end
