require_relative "card"
class Hand
    SCORES = {
        :high_two => 1,
        :high_three => 2,
        :high_four => 3,
        :high_five => 4,
        :high_six => 5,
        :high_seven => 6,
        :high_eight => 7,
        :high_nine => 8,
        :high_ten => 9,
        :high_jack => 10,
        :high_queen => 11,
        :high_king => 12,
        :high_ace => 13,
        :pair_two => 100,
        :pair_three => 101,
        :pair_four => ,
        :pair_five => 18,
        :pair_six => 19,
        :pair_seven => 20,
        :pair_eight => 21,
        :pair_nine => 22,
        :pair_ten => 23,
        :pair_jack => 24,
        :pair_queen => 25,
        :pair_king => 26,
        :pair_ace => 27,
        :three_two => 54,



    }

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

    def hand_score
        if royal_flush?
            :royal_flush
        elsif straight_flush?
            straight_flush_value
        elsif four_kind?
            four_kind_value
        elsif full_house?
            full_house_value
        elsif 


    end
end 

