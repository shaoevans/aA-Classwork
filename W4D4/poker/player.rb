class Player
    def initialize(money)
        @pot = money
        @hand = Hand.new
    end

    def win_money(amt)
        @pot += amt
    end
end