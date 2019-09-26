class Game < ApplicationRecord
    belongs_to :fighter, class_name => "User"
    belongs_to :challenger, class_name => "User"
    has_many :winners
end
