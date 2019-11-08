require "singleton"



module Slideable
  def moves
    x, y = @position[0], @position[1]
    case move_dirs
    when :diagonal
      diagonals
    when :horizontal
      horizontals
    when :both
      horizontals + diagonals
    end
  end

  def diagonals
    grow_unblocked_moves_in_dir(1,1) + grow_unblocked_moves_in_dir(-1,1) + grow_unblocked_moves_in_dir(-1,-1) + grow_unblocked_moves_in_dir(1,-1)
  end

  def horizontals
    grow_unblocked_moves_in_dir(1,0) + grow_unblocked_moves_in_dir(0,1) + grow_unblocked_moves_in_dir(-1,0) + grow_unblocked_moves_in_dir(0,-1)
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    result = []
    x,y = self.position
    current_pos = [x + dx, y + dy]
    until  !@board.valid_pos?(current_pos) || @board[current_pos].symbol != :green
      result << current_pos
      x, y = current_pos
      current_pos = [x + dx, y + dy]
    end
    if !@board.valid_pos?(current_pos) || @board[current_pos].symbol == @symbol  
      return result
    else
      result << current_pos
      return result
    end
  end
end

module Stepable
  def moves
    move_diffs.reject {|move| move[0] < 0 || move[0] > 7 || move[1] < 0 || move[1] > 7 || @board[move].symbol == @symbol }
  end
end

class Piece
  attr_reader :symbol
  attr_accessor :position
  def initialize(position, color, board)
    @position = position
    @symbol = color
    @board = board
  end

  def valid_moves
    moves.reject do |move|
      dupped = @board.duplicate
      dupped.move_piece!(@position, move)
      dupped.in_check?(@symbol)
    end
  end
end

class Queen < Piece
  include Slideable
  def move_dirs
    :both
  end

  def to_s
    if @symbol == :black
      " ♛ "
    else
      " ♕ "
    end
  end
end

class Bishop < Piece
  include Slideable
  def move_dirs
    :diagonal
  end

  def to_s
    if @symbol == :black
      " ♝ "
    else
      " ♗ "
    end
  end
end

class Knight < Piece
  include Stepable
  def move_diffs
    x, y = @position
    moves = [
      [x+2,y+1],
      [x+2,y-1],
      [x-2,y+1],
      [x-2,y-1],
      [x+1,y+2],
      [x-1,y+2],
      [x+1,y-2],
      [x-1,y-2]
    ]
    moves
  end
  def to_s
    if @symbol == :black
      " ♞ "
    else
      " ♘ "
    end
  end
end

class King < Piece
  include Stepable
  def move_diffs
    x, y = @position
    moves = [
      [x+1,y+1],
      [x-1,y-1],
      [x+1,y-1],
      [x-1,y+1],
      [x+1,y],
      [x-1,y],
      [x, y+1],
      [x, y-1]
    ]
    moves
  end

  def to_s
    if @symbol == :black
      " ♚ "
    else
      " ♔ "
    end
  end
end




class NullPiece < Piece 
  include Singleton
  def initialize
    super([], :green, [])
  end

  def moves
    []
  end

  def to_s
    "   "
  end
end


class Pawn < Piece

  def moves
    forward_steps + side_attacks
  end
  def at_start_row?
    @symbol == :black && @position[0] == 1 || @symbol  == :white && @position[0] == 6
  end

  def to_s
    if @symbol == :black
      " ♟ "
    else
      " ♙ " 
    end
  end

  def forward_dir
    if @symbol == :black 
      1
    else
      -1
    end
  end

  def forward_steps
    x,y = @position
    dx = self.forward_dir
    if !@board[[x + dx, y]].is_a?(NullPiece)
      return []
    elsif self.at_start_row? && @board[[x + dx + dx,y]].is_a?(NullPiece)
      return [[x+dx, y], [x+(dx*2), y]]
    else
      return [[x+dx, y]]
    end

  end

  def other_color(color)
    (color == :black) ? :white : :black
  end

  def side_attacks
    x,y = @position

    dir = self.forward_dir 
    possible_attacks = []

    if y+1 <= 7 && @board[[x + dir, y + 1]].symbol == other_color(@symbol)
      possible_attacks << [x + dir, y + 1]
    end 

    if y-1 >= 0 && @board[[x + dir, y - 1]].symbol == other_color(@symbol)
      possible_attacks << [x + dir, y - 1]
    end 
    possible_attacks
  end
end

class Rook < Piece
  include Slideable
  def move_dirs
    :horizontal
  end
  def to_s
    if @symbol == :black
        " ♜ "
    else
        " ♖ "
    end
  end
end