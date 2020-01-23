class CoachesController < ApplicationController
    def create
        @train = Coach.new(user_id: params[:user_id], trainer_id: params[:user][:trainer_id])
       if @train.valid?
         @train.save
         redirect_to user_profile_path(params[:user][:trainer_id])
       else
         redirect_to user_profile_path(params[:user][:trainer_id])
       end
      end
    
      def destroy
        @train = Coach.where({user_id: params[:user_id], trainer_id: params[:user][:trainer_id]})[0]
    
        @train.destroy
    
        redirect_to user_profile_path(params[:user][:trainer_id])
      end
end
