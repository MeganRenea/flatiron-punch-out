class UsersController < ApplicationController

    def new
    @user = User.new

    end

    def create 
        @user = User.find_or_create_by(params.require(:user).permit(:name))
        redirect_to @user
    end

    def show 
        @user = User.find(params[:id])
    end
end
