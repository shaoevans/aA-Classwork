require "colorize"
class Card
    SUITS = {heart: "♥", diamond: "♦", club: "♣", spade: "♠" }
    VALUES = {
        1 => "1",
        2 => "2",
        3 => "3",
        4 => "4",
        5 => "5",
        6 => "6",
        7 => "7",
        8 => "8",
        9 => "9",
        10 => "10",
        11 => "J",
        12 => "Q",
        13 => "K",
        14 => "A"
    }
    COLORS = {:heart => :red, :diamond => :red, :club => :black, :spade => :black}
    def initialize(value, suit)
        @value = value
        @suit = suit
    end

    def to_s
        msuit = SUITS[@suit]
        mvalue = VALUES[@value]
        if mvalue == "10"
            " #{msuit} #{mvalue}".colorize(:background => :light_white, color: COLORS[@suit])
        else
            " #{msuit} #{mvalue} ".colorize(:background => :light_white, color: COLORS[@suit])
        end
    end

    def white_space
        "     ".colorize(:background => :light_white)
    end

    def to_rs
        msuit = SUITS[@suit]
        mvalue = VALUES[@value]
        if mvalue == "10"
            "#{mvalue} #{msuit} ".colorize(:background => :light_white, color: COLORS[@suit])
        else
            " #{mvalue} #{msuit} ".colorize(:background => :light_white, color: COLORS[@suit])
        end
    end
end


# card = Card.new(14, :spade)
# card2 = Card.new(13, :heart)
# card3 = Card.new(12, :diamond)
# card4 = Card.new(11, :club)

# puts card
# puts card.white_space
# puts card.white_space
# puts card.to_rs