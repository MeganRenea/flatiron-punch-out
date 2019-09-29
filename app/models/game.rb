class Game < ApplicationRecord
    belongs_to :user
    belongs_to :computer
    
    def fight_lh
        computer = self.computer.moves
        
        if computer == "lh"
            self.computer.hp -= self.user.ap 
            self.user.hp -= 15
            self.user.save
            self.computer.save
        elsif computer == "rh"
            self.user.ap -= 2
            self.user.save
        elsif computer == "ld"
        elsif computer == "rd"
            self.computer.hp -= self.user.ap 
            self.computer.save
        end
        computer
    end

        def fight_rh
            computer = self.computer.moves
        
            if computer == "lh"
                self.user.ap -= 2
                self.user.save
            elsif computer == "rh"
                self.computer.hp -= self.user.ap 
                self.user.hp -= 15
                self.user.save
                self.computer.save
              
            elsif computer == "ld"
                self.computer.hp -= self.user.ap 
                self.computer.save
            elsif computer == "rd"
               
            end
    
            computer
        end

        def fight_rd
            computer = self.computer.moves
        
            if computer == "lh"
                self.user.hp -= 15
                self.user.save
            elsif computer == "rh"
                self.user.ap += 5
                self.user.save
            elsif computer == "ld"
                self.user.ap += 5
                self.user.save
            elsif computer == "rd"
                self.user.ap += 5
                self.user.save
            end
            computer
    
        end

        def fight_ld
            computer = self.computer.moves
        
            if computer == "lh"
                self.user.ap += 5
                self.user.save
            elsif computer == "rh"
                self.user.hp -= 15
                self.computer.save
            elsif computer == "ld"
                self.user.ap += 5
                self.user.save
            elsif computer == "rd"
                self.user.ap += 5
                self.user.save
            end
            computer
    
        end
    




end
