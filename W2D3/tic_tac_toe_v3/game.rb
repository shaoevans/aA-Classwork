require "byebug"
require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    def initialize(n, opts = {})
        @board = Board.new(n)
        @players = []
        opts.each do |k, v|
            if !v
                @players << HumanPlayer.new(k)
            else
                @players << ComputerPlayer.new(k)
            end
        end
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark)
            if @board.win?
                p "congrats" + @players.index(@current_player).to_s + "!"
                return nil
            else
                self.switch_turn
            end
        end
        p 'draw'
        @board.print
    end
end


machine_civil_war = Game.new(10, h: true, u: true, e: true)
machine_civil_war.play


