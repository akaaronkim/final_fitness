class ReviewsController < ApplicationController
  def create
    
    @review = Review.new(user_id: session[:user_id], workout_id: params[:workout_id], text: params[:review][:text])
    if @review.valid?
      @review.save
      redirect_to user_workouts_path(session[:user_id], params[:workout_id])
    else
      redirect_to user_workouts_path(session[:user_id], params[:workout_id])
    end
  end
end
