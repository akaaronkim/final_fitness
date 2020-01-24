class CoachesController < ApplicationController
    def create
        @train = Coach.new(user_id: params[:user_id], trainer_id: params[:user][:trainer_id])
       if @train.valid?
         @train.save
         redirect_to user_profiles_path(params[:user][:trainer_id])
       else
         redirect_to user_profiles_path(params[:user][:trainer_id])
       end

       @advise = Coach.new(user_id: params[:user_id], dietitian_id: params[:user][:dietitian_id])
       if @advise.valid?
         @advise.save
         redirect_to user_profiles_path(params[:user][:dietitian_id])
       else
         redirect_to user_profiles_path(params[:user][:dietitian_id])
       end
      end
    
      def destroy
        if @train = Coach.where({user_id: params[:user_id], trainer_id: params[:user][:trainer_id]})[0]
    
        @train.destroy
    
        redirect_to user_profiles_path(params[:user][:trainer_id])
        elsif
        @advise = Coach.where({user_id: params[:user_id], dietitian_id: params[:user][:dietitian_id]})[0]
    
        @advise.destroy
    
        redirect_to user_profiles_path(params[:user][:dietitian_id])
        end
      end
end
