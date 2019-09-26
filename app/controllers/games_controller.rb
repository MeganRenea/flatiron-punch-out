class GamesController < ApplicationController

    def new
        @game = Game.new
    end

    def create
    @user = User.find_or_create_by(params.require(:user).permit(:name))
    @game = Game.create
    redirect_to @game

    end

    def show

    end


end
