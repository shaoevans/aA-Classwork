require_relative "board.rb"
require_relative "humanplayer.rb"
require_relative "cursor.rb"
require_relative "display.rb"
require_relative "piece.rb"
class Game
  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new("Mae", @board, :black)
    @player2 = HumanPlayer.new("Evans", @board, :white)
    @current_player = @player1
  end

  def play
    until game_over?
      @current_player.make_move
      self.switch_turn
    end
      puts "congragulations #{@current_player.name}"
  end

  def switch_turn
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def game_over?
    @board.checkmate?(:black) || @board.checkmate?(:white)
  end
end

game = Game.new
game.play