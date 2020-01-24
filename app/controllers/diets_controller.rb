class DietsController < ApplicationController
    class WorkoutsController < ApplicationController
        before_action :set_diet, only: [:destroy, :show]
    
      def index
        @user = User.find(params[:user_id])
        @diets = @user.diets
      end
    
      def destroy
        @user = User.find(params[:user_id])
        @diet.destroy
        redirect_to user_profiles_edit_path(@user)
      end
    
      def show
        @advice_id = Diet.find(params[:id]).user_id
        @new_review = Review.new
        @reviews = @diet.sorted_reviews
        @current_user = session[:user_id]
      end
    
      def new
        @diet = Diet.new
        @user = User.find(session[:user_id])
        @content_types = ["Workout", "Diet"]
      end
    
      def create
        @user = User.find(session[:user_id])
        @diet = Diet.new(diet_params)
        @user.diets << @diet
        if @diet.save
          @user.save
          redirect_to user_profiles_path(:user_id)
        else
          render :new
        end
      end
    
      private
      def set_diet
        @diet = Diet.find(params[:id])
      end
    
      def diet_params
        params.require(:diet).permit(:title, :description, :content_link, :content_type, :user_id)
      end
    end
    
end
