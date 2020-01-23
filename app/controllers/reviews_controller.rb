class ReviewsController < ApplicationController
    belongs_to :workout
    belongs_to :user
  
    
  
    def find_user
      User.find(self.user_id).name
    end
end
