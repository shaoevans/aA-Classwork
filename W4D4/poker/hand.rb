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

card = Card.new(14, :spade)
card2 = Card.new(13, :heart)
card3 = Card.new(12, :diamond)
card4 = Card.new(11, :club)

hand = Hand.new
hand.get_card(card)

hand.get_card(card2)
hand.render
