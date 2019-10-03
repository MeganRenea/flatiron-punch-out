class Game < ApplicationRecord
    belongs_to :user
    belongs_to :computer
    
    def fight_lh
        computer = self.computer.moves
        
        if computer == "lh"
            self.computer.hp -= self.user.ap 
            self.user.hp -= self.computer.ap
            self.computer.save
            self.user_hits += 1
            self.user.points += self.user.ap
            self.save
            self.user.save
            computer = "You Both Trade Left Hooks"
        elsif computer == "rh"
            self.user.ap = self.user.ap - 5
            self.user.save
            computer = " #{self.computer.name} Blocks!"
        elsif computer == "ld"
            computer = "Your Left Hook Misses!"
        elsif computer == "rd"
            self.computer.hp -= self.user.ap 
            self.computer.save
            self.user.points += self.user.ap
            self.user_hits += 1
            self.user.save
            self.save
            computer = "You Land a Left Hook!"
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
                self.user.points += self.user.ap
                self.user.save
                self.computer.save
                self.user_hits += 1
                self.save
                computer = "You Both trade Right Hooks"
            elsif computer == "ld"
                self.computer.hp -= self.user.ap 
                self.computer.save
                self.user_hits += 1
                self.user.points += self.user.ap
                self.user.save
                self.save
                computer = "Your Right Hook Lands"
            elsif computer == "rd"
                computer = "Your Right Hook Misses!"
               
            end
    
            computer
        end

        def fight_rd
            computer = self.computer.moves
        
            if computer == "lh"
                self.user.hp -= self.computer.ap
                self.user.save
                computer = "#{self.computer.name} Connects with a Left Hook!"
            elsif computer == "rh"
                self.user.ap = self.user.ap + 5
                self.user.points += 10
                self.user.save
                self.save
                computer = "You Dodge #{self.computer.name}'s Right Hook!"
            elsif computer == "ld"
                self.user.ap = self.user.ap + 5
                self.user.points += 10
                self.user.save
                computer = "You Both Dodge"
            elsif computer == "rd"
                self.user.ap = self.user.ap + 5
                self.user.save
                self.user.points += 10
                self.user.save
                computer = "You Both Dodge"

            end
            computer
    
        end

        def fight_ld
            computer = self.computer.moves
        
            if computer == "lh"
                self.user.ap = self.user.ap + 5
                self.user.points += 10
                self.user.save
                computer = "You Dodge #{self.computer.name}'s Left Hook"
            elsif computer == "rh"
                self.user.hp -= self.computer.ap
                self.user.save
                computer = "#{self.computer.name} Connects with a Right Hook!"
            elsif computer == "ld"
                self.user.ap = self.user.ap + 5
                self.user.points += 10
                self.user.save
                computer = "You Both Dodge"
            elsif computer == "rd"
                self.user.ap = self.user.ap + 5
                self.user.points += 10
                self.user.save
                computer = "You Both Dodge"
            end
            computer
    
        end

        def uppercut
            self.computer.hp -= 20
            self.computer.save
            self.user.points += 20
            self.user.save
            
        end
    




end
