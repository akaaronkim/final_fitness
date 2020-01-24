class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  skip_before_action :authenticate_user, only: [:new, :create]

  def show
    @trainer_hash = @user.find_trainers
    @trainer_count = @user.coaches.count
    @new_review = Review.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
   if @user.valid?
     @user.save
     session[:user_id] = @user.id
     redirect_to user_path(@user.id)
   else
     flash[:message] = @user.errors.full_messages
     redirect_to new_user_path
   end
  end


  def trainer
    @new_review = Review.new
    @content_types = ["Workout", "Diet"]
    @workouts = Workout.all
      if @workouts == nil
        @searched = false
      elsif params[:search] && @workouts.length >= 1
        @searched = true
      end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :url, :bio, :username, :img, :address, :phone, :occupation,  :password, :password_confirmation, :search)
  end
end
