class User < ApplicationRecord
    before_save :ap_adjust
    has_many :games
    has_many :winners


    def wins
    wins = Winner.all.select {|winner| winner.user == self}.count
    wins ||= 0
    end

    def high_score
        wins = Winner.all.select {|winner| winner.user == self}
        if wins != []
        high_score = wins.reduce(0) do |score, win|
            
            if win.game.points > score
                score = win.game.points
            end
            score
        end
        else
            high_score = 0
        end
        high_score
    end

    private

    def ap_adjust
        if ap < 10
            self.ap = 10
        elsif ap > 35
            self.ap = 35
        end
    end



end
