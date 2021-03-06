class GamesController < ApplicationController

    def new
    end

    def create
    @user = User.find(params[:user_id])
    if @user.level == 2
        flash[:computer] = ""
        @computer = Computer.create(name: "Sebastian", ap: 20)
        @game = Game.create(user_id: @user.id, computer: @computer)
        redirect_to "/users/#{@user.id}/games/#{@game.id}"
    elsif @user.level == 3
        flash[:computer] = ""
        @computer = Computer.create(name: "Red Darkness", ap: 30)
        @game = Game.create(user_id: @user.id, computer: @computer)
        redirect_to "/users/#{@user.id}/games/#{@game.id}"
    else 
        flash[:computer] = ""
        @user.points = 0
        @user.level = 1
        @computer = Computer.create(name: "Yoan")
        @game = Game.create(user_id: @user.id, computer: @computer)
        @user.save
        redirect_to "/users/#{@user.id}/games/#{@game.id}"
    end


    end

    def show
        @user = User.find(params[:user_id])
        @game = Game.find(params[:id])
        @computer = @game.computer
        if @game.computer.hp <= 0 && @game.round <= 3 && @game.user_wins < 2 && @game.computer_wins < 2
            flash[:results] = "You Win!"
            @game.points += @user.hp + @user.ap
            @game.round += 1
            @game.user_wins += 1
            @game.user_hits = 0
            @user.hp = 100
            @user.ap = 10
            @user.save
            @computer.hp = 100
            @user.save
            @computer.save
            @game.save
            render :round unless @game.computer_wins >= 2 || @game.user_wins >= 2
        elsif @user.hp <= 0 && @game.round <= 3 && @game.user_wins < 2 && @game.computer_wins < 2
            flash[:results] = "You lose!"
            @user.points -= 50
            @game.round += 
            @game.computer_wins += 1
            @user.hp = 100
            @game.user_hits = 0
            @user.ap = 10
            @user.save
            @computer.hp = 100
            @computer.save
            @game.save
            render :round unless @game.computer_wins >= 2 || @game.user_wins >= 2
        end
        if @game.computer_wins >= 2
            @user.level = 1
            @user.points = 0
            @user.save
            render :lose
        elsif @game.user_wins >= 2
            winner = Winner.create(user: @user, game_id: @game.id, user_points: @user.points)
            @game.user_wins += 1
            @game.user_hits = 0
            @user.hp = 100
            @user.ap = 10
            @user.save
            @computer.hp = 100
            @user.save
            @computer.save
            @game.save
            @user.level += 1
            @user.save
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

    def uppercut
        @game = Game.find(params[:game_id])
        @game.uppercut
        @game.user_hits = 0
        @game.save
        redirect_to user_game_path(params[:user_id],@game)
        flash[:computer] = "Uppercut!! 20 Damage!"
    end

    def computer_lvl
        @user = User.find(params[:user_id])
        render :computer_lvl
    end

    def next_round
        @game = Game.find(params[:game_id])
        redirect_to user_game_path(params[:user_id],@game)
    end
   
end
