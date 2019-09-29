class User < ApplicationRecord
    has_many :games
    has_many :winners

    def wins
    wins = Winner.all.select {|winner| winner.user == self}.count
    wins ||= 0
    end


    def ap=(num) 
        if num < 10
        @ap = 10
        end
        if num > 35
            @ap = 35
        end
        @ap = num
    end


end
