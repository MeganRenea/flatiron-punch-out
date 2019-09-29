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
            self.user_hits += 1
            self.save
            computer += " Hit!"
        elsif computer == "rh"
            self.user.ap = self.user.ap - 5
            self.user.save
            computer += " RedDarkness Blocks!"
        elsif computer == "ld"
            computer += " Miss!"
        elsif computer == "rd"
            self.computer.hp -= self.user.ap 
            self.computer.save
            self.user_hits += 1
            self.save
            computer += " Hit!"
        end
        computer
    end

        def fight_rh
            computer = self.computer.moves
        
            if computer == "lh"
                self.user.ap =  self.user.ap - 5
                self.user.save
                computer += " RedDarkness Blocks!"

            elsif computer == "rh"
                self.computer.hp -= self.user.ap 
                self.user.hp -= 15
                self.user.save
                self.computer.save
                self.user_hits += 1
                self.save
                computer += " Hit!"
            elsif computer == "ld"
                self.computer.hp -= self.user.ap 
                self.computer.save
                self.user_hits += 1
                self.save
                computer += " Hit!"
            elsif computer == "rd"
                computer += " Miss!"
               
            end
    
            computer
        end

        def fight_rd
            computer = self.computer.moves
        
            if computer == "lh"
                self.user.hp -= 15
                self.user.save
                computer += "RedDarkness Hits!"
            elsif computer == "rh"
                self.user.ap = self.user.ap + 5
                self.user.save
                computer += " Successful Dodge!"
            elsif computer == "ld"
                self.user.ap = self.user.ap + 5
                self.user.save
                computer += " Successful Dodge!"
            elsif computer == "rd"
                self.user.ap = self.user.ap + 5
                self.user.save
                computer += " Successful Dodge!"
            end
            computer
    
        end

        def fight_ld
            computer = self.computer.moves
        
            if computer == "lh"
                self.user.ap = self.user.ap + 5
                self.user.save
                computer += " Successful Dodge!"
            elsif computer == "rh"
                self.user.hp -= 15
                self.computer.save
                computer += "RedDarkness Hits!"
            elsif computer == "ld"
                self.user.ap = self.user.ap + 5
                self.user.save
                computer += " Successful Dodge!"
            elsif computer == "rd"
                self.user.ap = self.user.ap + 5
                self.user.save
                computer += " Successful Dodge!"
            end
            computer
    
        end

        def uppercut
            self.computer.hp -= 20
            self.computer.save
            self.save
        end
    




end
