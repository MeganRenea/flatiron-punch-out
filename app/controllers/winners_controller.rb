class WinnersController < ApplicationController
    def index
        @hash = Winner.all.reduce({}) do |hash, winner|
            hash[winner.user.name] ||= 1
            hash[winner.user.name] += 1
            hash
        end
        @hash = hash.sort_by {|k, v| -v}

    end
end
