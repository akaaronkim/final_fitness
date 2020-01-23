class PumpsController < ApplicationController
    def create
        @pump = Pump.create(user_id: session[:user_id], workout_id: params[:workout_id])
         redirect_to user_workout_path(params[:user_id], params[:workout_id])
      end
    
end
