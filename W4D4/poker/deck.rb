class Deck
    SUITS = [:heart, :club, :spade, :diamond]
    VALUES = [2,3,4,5,6,7,8,9,10,11,12,13]
    def initialize
        @cards = []
        self.populate
        self.shuffle!
    end

    def populate
        SUITS.each do |suit|
            VALUES.each do |val|
                @cards << Card.new(val, suit)
            end
        end
    end
    
    def shuffle!
        @cards.shuffle!
    end

    def give_card
        @cards.pop
    end
end

