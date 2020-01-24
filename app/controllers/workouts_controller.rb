class WorkoutsController < ApplicationController
    before_action :set_workout, only: [:destroy, :show]

  def index
    @user = User.find(params[:user_id])
    @workouts = @user.workouts
  end

  def destroy
    @user = User.find(params[:user_id])
    @workout.destroy
    redirect_to user_profiles_edit_path(@user)
  end

  def show
    @training_id = Workout.find(params[:id]).user_id
    @new_review = Review.new
    @reviews = @workout.sorted_reviews
    @current_user = session[:user_id]
  end

  def new
    @workout = Workout.new
    @user = User.find(session[:user_id])
    @content_types = ["Workout", "Diet"]
  end

  def create
    @user = User.find(session[:user_id])
    @workout = Workout.new(workout_params)
    @user.workouts << @workout
    if @workout.save
      @user.save
      redirect_to user_profiles_path(:user_id)
    else
      render :new
    end
  end

  private
  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:title, :description, :content_link, :content_type, :user_id)
  end
end
