class Board
    def initialize
        @grid = Array.new(9) {Array.new(9) {Tile.new}}
    end

    def place_mines
        40.times do
            i = rand(0..8)
            j = rand(0..8)
            until @grid[i][j] != "B"
                i = rand(0..8)
                j = rand(0..8)
            end
            @grid[i][j] = "B"
        end
    end

    def print_board
        row.each
    end

    def game_over
        self.reveal_bombs
        self.
    end

    def reveal_bombs
    end
end

board = Board.new
board.place_mines
p board