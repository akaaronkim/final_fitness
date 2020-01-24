class User < ApplicationRecord
  has_many :coaches
  has_many :workouts
  has_many :diets
  has_many :reviews
  has_secure_password

  def find_trainers
    trainer_ids = Coach.where("user_id = ?", self.id).pluck("trainer_id")
  
    trainer_objects = Array.new
     trainer_ids.each do |train|
         trainer_objects << User.find(train)
     end
     
     trainer_data = Hash.new
      trainer_objects.each do |train|
          latest_workout = train.workouts.last
          trainer_data[train.name] = {}
          trainer_data[train.name][:latest_workout_title] = latest_workout.title
          trainer_data[train.name][:latest_workout_date] = (latest_workout.created_at.strftime("%B %d, %Y"))
          trainer_data[train.name][:user_id] = latest_workout.user_id
          trainer_data[train.name][:workout_id] = latest_workout.id
          trainer_data[train.name][:review_count] = latest_workout.reviews.count
          trainer_data[train.name][:content_type] = latest_workout.content_type
     end
  
      trainer_data.sort_by do | name, latest_workout|
          latest_workout[:created_at]
      end
  end

  def find_dietitians
    dietitian_ids = Coach.where("user_id = ?", self.id).pluck("dietitian_id")
  
    dietitian_objects = Array.new
     dietitian_ids.each do |die|
         dietitian_objects << User.find(die)
     end
     
     dietitian_data = Hash.new
      dietitian_objects.each do |die|
          latest_workout = die.diets.last
          dietitian_data[die.name] = {}
          dietitian_data[die.name][:latest_diet_title] = latest_diet.title
          dietitian_data[die.name][:latest_diet_date] = (latest_diet.created_at.strftime("%B %d, %Y"))
          dietitian_data[die.name][:user_id] = latest_diet.user_id
          dietitian_data[die.name][:diet_id] = latest_diet.id
          dietitian_data[die.name][:review_count] = latest_diet.reviews.count
          dietitian_data[die.name][:content_type] = latest_diet.content_type
     end
  
      dietitian_data.sort_by do | name, latest_diet|
          latest_diet[:created_at]
      end
  end

    def trainer_ids
        trainer_ids = Coach.where("user_id = ?", self.id).pluck("trainer_id")
    end

    def dietitian_ids
        dietitian_ids = Diet.where("user_id = ?", self.id).pluck("dietitian_id")
    end
end