require "byebug"
require_relative "board"
require_relative "human_player"

class Game
    def initialize
        @board = Board.new
        @player_one = HumanPlayer.new(:X)
        @player_two = HumanPlayer.new(:O)
        @current_player = @player_one

    end

    def switch_turn
        if @current_player == @player_one
            @current_player = @player_two
        else
            @current_player = @player_one
        end
    end

    def play
        while @board
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


game = Game.new
game.play