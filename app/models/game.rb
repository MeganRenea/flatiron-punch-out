class Game < ApplicationRecord
    belongs_to :user
    belongs_to :computer
    
    def fight_lh
        computer = self.computer.moves
        
        if computer == "lh"
            self.computer.hp -= self.user.ap 
            self.user.hp -= self.computer.ap
            self.user.save
            self.computer.save
            self.user_hits += 1
            self.points += self.user.ap
            self.save
            computer = "You Left Hook! The Computer Left Hooks!"
        elsif computer == "rh"
            self.user.ap = self.user.ap - 5
            self.user.save
            computer = " #{self.computer.name} Blocks!"
        elsif computer == "ld"
            computer = "You Miss!"
        elsif computer == "rd"
            self.computer.hp -= self.user.ap 
            self.computer.save
            self.points += self.user.ap
            self.user_hits += 1
            self.save
            computer = " You Left Hook!"
        end
        computer
    end

        def fight_rh
            computer = self.computer.moves
        
            if computer == "lh"
                self.user.ap =  self.user.ap - 5
                self.user.save
                computer = " #{self.computer.name} Blocks!"

            elsif computer == "rh"
                self.computer.hp -= self.user.ap 
                self.user.hp -= self.computer.ap
                self.points += self.user.ap
                self.user.save
                self.computer.save
                self.user_hits += 1
                self.save
                computer = "You Right Hook! #{self.computer.name} Right Hooks!"
            elsif computer == "ld"
                self.computer.hp -= self.user.ap 
                self.computer.save
                self.user_hits += 1
                self.points += self.user.ap
                self.save
                computer = "You Right Hook"
            elsif computer == "rd"
                computer = "You Miss!"
               
            end
    
            computer
        end

        def fight_rd
            computer = self.computer.moves
        
            if computer == "lh"
                self.user.hp -= self.computer.ap
                self.user.save
                computer = "#{self.computer.name} Hits You With Left Hook!"
            elsif computer == "rh"
                self.user.ap = self.user.ap + 5
                self.user.save
                self.points += 10
                self.save
                computer = "#{self.computer.name} Right Hooks You Dodge Right!"
            elsif computer == "ld"
                self.user.ap = self.user.ap + 5
                self.user.save
                self.points += 10
                self.save
                computer = "#{self.computer.name} Dodges Left You Dodge Right!"
            elsif computer == "rd"
                self.user.ap = self.user.ap + 5
                self.user.save
                self.points += 10
                self.save
                computer = " #{self.computer.name} Dodges Right You Dodge Right!"

            end
            computer
    
        end

        def fight_ld
            computer = self.computer.moves
        
            if computer == "lh"
                self.user.ap = self.user.ap + 5
                self.user.save
                self.points += 10
                self.save
                computer = "#{self.computer.name} Left Hooks You Dodge Left"
            elsif computer == "rh"
                self.user.hp -= self.computer.ap
                self.computer.save
                computer = "#{self.computer.name} Hits You With Right Hook!"
            elsif computer == "ld"
                self.user.ap = self.user.ap + 5
                self.user.save
                self.points += 10
                self.save
                computer = "#{self.computer.name} Dodges Left You Dodge Left!"
            elsif computer == "rd"
                self.user.ap = self.user.ap + 5
                self.user.save
                self.points += 10
                self.save
                computer = "#{self.computer.name} Dodges Right You Dodge Left!"
            end
            computer
    
        end

        def uppercut
            self.computer.hp -= 20
            self.computer.save
            self.points += 20
            self.save
            
        end
    




end
