
module Slideable
  def moves
    x, y = @position[0], @position[1]
    results = []
    case move_dirs
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

module Stepable
end

class Piece
  attr_reader :symbol
  def initialize(position, color, board)
    @position = position
    @symbol = color
    @board = board
  end
end

class Rook < Piece
  include Slideable
  def move_dirs
    :horizontal
  end
end

class Queen < Piece
  include Slideable
  def move_dirs
    :both
  end
end

class Bishop < Piece
  include Slideable
  def move_dirs
    :diagonal
  end
end

class Knight < Piece
  include Stepable
end

class King < Piece
  include Stepable
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