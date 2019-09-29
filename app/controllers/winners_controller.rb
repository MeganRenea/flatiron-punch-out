class WinnersController < ApplicationController
    def index
        @user = User.find(params[:id])
        @hash = Winner.all.reduce({}) do |hash, winner|
            hash[winner.user.name] ||= 0
            hash[winner.user.name] += 1
            hash
        end
        @hash = @hash.sort_by {|k, v| -v}

    end
end
