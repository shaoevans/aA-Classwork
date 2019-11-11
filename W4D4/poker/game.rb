require_relative "deck"
require_relative "player"
class Game
    attr_reader :pot
    def initialize(num_players)
        @cards = []
        @pot = 0
        @deck = Deck.new
        @players = []
        num_players.times do
            @players << Player.new(500, self)
        end
        @current_player = @players[0]
    end

    def deal
        2.times do 
            @players.each do |player|
                player.hand.get_card(@deck.give_card)
            end
        end
    end

    def flop
        self.burn
        3.times {@cards << @deck.give_card}
        self.render
    end

    def turn
        self.burn
        @cards << @deck.give_card
        self.render
    end

    def river
        self.burn
        @cards << @deck.give_card
        self.render
    end

    def burn
        @deck.give_card
    end

    def receive_bets
        @round_players = @players.dup
        
        puts "please enter an amount to bet, or type 'fold' to fold"

    end

    def play
        self.deal 
        #receive bets
        self.flop 
        #receive bets
        self.turn 
        #receive bets
        self.river
        #receive bets
        #show & compare hands
    end

    def receive_bets
        in_play = @players.dup
        @playy
    end

    def render
        system("clear")
        mapped = @cards.map{|card| card.to_s} 
        puts mapped.join(" ")
        mapped = @cards.map{|card| card.white_space}
        puts mapped.join(" ")
        puts mapped.join(" ")
        mapped = @cards.map{|card| card.to_rs}
        puts mapped.join(" ")
        puts "__________________________________________"
        puts
        @current_player.hand.render
        @current_player.show_pot
    end
end

game = Game.new(3)
game.deal
game.flop
game.render
game.turn
game.render
game.river
game.render