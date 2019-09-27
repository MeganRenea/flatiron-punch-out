class GamesController < ApplicationController

    def new
    end

    def create

    @user = User.find(params[:user_id])
    @user.update(hp: 100)
    @computer = Computer.create
    @game = Game.create(user_id: @user.id, computer: @computer)
    redirect_to "/users/#{@user.id}/games/#{@game.id}"

    end

    def show
        @user = User.find(params[:user_id])
        @game = Game.find(params[:id])
        @computer = @game.computer
        if @game.computer.hp <= 0 && @game.round < 3
            flash[:results] = "You Win!"
            @game.round += 1
            @game.user_wins += 1
            @user.hp = 100
            @user.ap = 10
            @user.save
            @computer.hp = 100
            @computer.save
            @game.save
        elsif @user.hp <= 0 && @game.round < 3
            flash[:results] = "You lose!"
            @game.round += 1
            @game.computer_wins += 1
            @user.hp = 100
            @user.ap = 10
            @user.save
            @computer.hp = 100
            @computer.save
            @game.save
        end
        if @game.computer_wins == 2
            render :lose
        elsif @game.user_wins == 2
            winner = Winner.create(user: @user)
            render :win
        end

    end

    def left_hook
        @game = Game.find(params[:game_id])
        computer = @game.fight_lh
        flash[:computer] = computer
        redirect_to user_game_path(params[:user_id],@game)
    end

    def right_hook
        @game = Game.find(params[:game_id])
        computer = @game.fight_rh
        flash[:computer] = computer
        redirect_to user_game_path(params[:user_id],@game)
    end
    def left_dodge
        @game = Game.find(params[:game_id])
        computer = @game.fight_ld
        flash[:computer] = computer
        redirect_to user_game_path(params[:user_id],@game)
    end
    def right_dodge
        @game = Game.find(params[:game_id])
        computer = @game.fight_rd
        flash[:computer] = computer
        redirect_to user_game_path(params[:user_id],@game)
    end

end
