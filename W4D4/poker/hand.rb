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


end 