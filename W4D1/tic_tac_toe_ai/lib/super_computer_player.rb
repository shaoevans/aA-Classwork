require_relative 'tic_tac_toe_node'
require "byebug"
class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node =  TicTacToeNode.new(game.board, mark)
    node.children.each{ |child| return child.prev_move_pos if child.winning_node?(mark) }
    node.children.each { |child| return child.prev_move_pos if !child.losing_node?(mark)}
    raise "No losing nodes"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
