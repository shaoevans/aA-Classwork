require_relative "card"
class Hand
    def initialize
        @cards = []
    end

    def get_card(card)
        @cards << card
    end

    def reset
        @cards = []
    end 

    def render
        mapped = @cards.map{|card| card.to_s} 
        puts mapped.join(" ")
        mapped = @cards.map{|card| card.white_space}
        puts mapped.join(" ")
        puts mapped.join(" ")
        mapped = @cards.map{|card| card.to_rs}
        puts mapped.join(" ")
    end


end 

