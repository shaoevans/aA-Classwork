require_relative "hand"
class Player
    attr_reader :hand
    def initialize(money, game)
        @pot = money
        @hand = Hand.new
        @game = game
    end

    def win_money(amt)
        @pot += amt
    end

    def show_pot
        puts "Pot Amount: #{@pot}"
    end

    def make_bet
        puts "please enter an amount to be, or type 'fold' to fold"
        input = gets.chomp
        if input == "fold"
        end
    end
end

