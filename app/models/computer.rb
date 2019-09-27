class Computer < ApplicationRecord
    has_many :games, foreign_key => "challenger"
    has_many :characters, through: :games, foreign_key => "player"
end
