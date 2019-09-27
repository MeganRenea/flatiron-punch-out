class Computer < ApplicationRecord
    has_many :games
    
    def moves
    moves_selection = ["lh", "rh", "ld", "rd"]
    moves_selection.sample
    end
end
