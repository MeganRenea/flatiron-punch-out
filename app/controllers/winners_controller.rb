class WinnersController < ApplicationController
    def index
        @user = User.find(params[:id])
        @hash = User.all.reduce({}) do |hash, user| 
            hash[user.name] = user.high_score
            hash
        end
        @hash = @hash.sort_by {|k, v| -v}

    end
end
