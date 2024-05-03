class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if user_params[:name].nil? or user_params[:email].nil? or user_params[:password].nil? or user_params[:password_confirmation].nil?
            redirect_to "/users" and return
        end

        if user_params[:name]!="" or user_params[:email]!="" or user_params[:password]!="" or user_params[:password_confirmation]!=""
            redirect_to "/users" and return
        end

        if @user.save
            redirect_to admin_movies_path
        else
            redirect_to "/users" and return
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end
