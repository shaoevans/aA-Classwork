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

    def render
        mapped = @river.map{|card| card.to_s} 
        puts mapped.join(" ")
        mapped = @river.map{|card| card.white_space}
        puts mapped.join(" ")
        puts mapped.join(" ")
        mapped = @river.map{|card| card.to_rs}
        puts mapped.join(" ")
    end
end

