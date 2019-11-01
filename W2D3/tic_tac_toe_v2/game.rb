require "byebug"
require_relative "board"
require_relative "human_player"

class Game
    MARKS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    def initialize(n, players)
        @board = Board.new(n)
        @players = []
        players.times {|i| @players << HumanPlayer.new(MARKS[i])}
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?
                if @current_player == @player_one 
                    p "victory player one!"
                else
                    p "victory player two!"
                end
                return nil
            else
                self.switch_turn
            end
        end
        p 'draw'
    end
end

game = Game.new(4, 3)
game.play


