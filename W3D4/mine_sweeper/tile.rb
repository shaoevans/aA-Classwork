class Tile
    attr_reader :board
    def initialize(board)
        @bomb = false
        @board = board


    end
    
    def make_bomb
        @bomb = true
    end
    
    def bomb?
        @bomb
    end

    def neighbors
    end

    def neighbor_bomb_count

    end

    def print_tile
        
    end

    def reveal
        if @bomb
            @board.game_over
        else
            bombs = self.neighbor_bomb_count
            if bombs == 0
                neighbors.each {|neighbor| neighbor.reveal}
            end

        end
    end
end