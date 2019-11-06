
module Slideable
  def moves(symbol)
    x, y = @position[0], @position[1]
    results = []
    case symbol
    when :diagonal
      diagonals
    when :horizontal
      horizontals
    when :both
      horizontals + diagonals
    end
    results
  end

  def diagonals
    x, y = @position[0], @position[1]
    results = []
    (1..7).each do |i|
      results << [x+i,y+i] if x+i < 8 && y+i < 8
      results << [x-i,y-i] if x-i > 0 && y-i > 0
      results << [x-i,y+i] if x-i > 0 && y+i < 8 
      results << [x+i,y-i] if x+i < 8 && y-1 > 0
    end
    results 
  end

  def horizontals
    x, y = @position[0], @position[1]
    results = []
    8.times do |i|
      results << [i, y] if x != i
      results << [x, i] if y != i
    end
    results 
  end
end

module Steppable
  def moves
  end
end

class Piece
  def initialize(position, color, board)
    @position = position
    @color = color
    @board = board
  end
end

class SlidingPiece < Piece
  include Slideable
  
  def move_dirs
    case @symbol
    when :bishop
      :diagonal
    when :queen
      :both
    when :rook
      :horizontal
    end
  end
end

class SteppingPiece < Piece
  include Steppable
end

class NullPiece < Piece 
  include Singleton
  def moves
    []
  end
end

class Pawn < Piece
  def initialize(position, color, board)
    super
  end

  def at_start_row?
    @color == :black && @position[0] == 1 || @color == :white && @position[0] == 6
  end

  def forward_dir
    if @color == :black 
      1
    else
      -1
    end
  end
end