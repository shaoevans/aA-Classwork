require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over? 
      if @board.winner == evaluator || @board.winner.nil?
        return false
      else 
        return true
      end
    end

    if evaluator == @next_mover_mark
      self.children.all?{|child| child.losing_node?(evaluator)}
    else
      self.children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if @board.over? 
      if @board.winner == evaluator
        return true
      else 
        return false
      end
    end

    if evaluator == @next_mover_mark
      self.children.any?{|child| child.winning_node?(evaluator)}
    else
      self.children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  def other_mark
    (@next_mover_mark == :o) ? :x : :o
  end
  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    result = []
    3.times do |i|
      3.times do |j|
        if @board.empty?([i,j])
          duped_board = @board.dup
          duped_board[[i,j]] = @next_mover_mark
          result << TicTacToeNode.new(duped_board, self.other_mark, [i, j])
        end
      end
    end
    result
  end
end

node = TicTacToeNode.new(Board.new, :x)
node.board[[0, 0]] = :o
node.board[[2, 2]] = :o
node.board[[0, 2]] = :o
node.losing_node?(:x)

