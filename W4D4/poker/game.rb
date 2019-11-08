class Game
    def initialize(num_players)
        @river = []
        @deck = Deck.new
        @players = []
        num_players.times do
            @players << Player.new(500)
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

    def reveal_river
        @river << @deck.give_card
    end

    def play

    end

    def receive_bets
        in_play = @players.dup
        @playy
    end
end