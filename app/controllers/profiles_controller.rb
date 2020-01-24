class ProfilesController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    
    def login
      @profile = User.new
    end
  
    def create
      @profile = User.new(user_params)
      if @profile.save
        redirect_to user_path(@profile)
      else
        render :login
      end
    end
  
    def show
      @current_user = User.find(session[:user_id])
      @workout = @user.workouts.sort_by do |workout|
        workout.created_at
      end.reverse
    end
  
    def edit
      @workouts = @user.workouts
    end
  
    def update
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    end
  
  
  private
  
  def set_user
    @user = User.find(session[:user_id])
  end
  
  def user_params
    params.require(:user).permit(:name, :url, :bio, :username, :img, :address, :phone, :occupation,  :password, :password_confirmation, :search)
  end
end
