require_relative "piece"
require "byebug"
require_relative "display"
class Board
  @@null = NullPiece.instance
  attr_reader :grid, :display
  def initialize(grid=nil)
    if grid.nil?
      @grid = Array.new(8) { Array.new(8) }
      self.populate
    else
      @grid = grid
    end
    @display = Display.new(self)
    
  end

  def populate
    8.times do |i|
      if i == 0
        @grid[i][0], @grid[i][7] = Rook.new([i,0], :black, self), Rook.new([i,7], :black, self)
        @grid[i][1], @grid[i][6] = Knight.new([i,1], :black, self), Knight.new([i,6], :black, self)
        @grid[i][2], @grid[i][5] = Bishop.new([i,2], :black, self), Bishop.new([i,5], :black, self)
        @grid[i][3] = Queen.new([i,3], :black, self)
        @grid[i][4] = King.new([i,4], :black, self)
      elsif i == 1 
        8.times {|j| @grid[i][j] = Pawn.new([i,j], :black, self)}
      elsif i == 6
        8.times {|j| @grid[i][j] = Pawn.new([i,j], :white, self)}
      elsif i == 7
        @grid[i][0], @grid[i][7] = Rook.new([i,0], :white, self), Rook.new([i,7], :white, self)
        @grid[i][1], @grid[i][6] = Knight.new([i,1], :white, self), Knight.new([i,6], :white, self)
        @grid[i][2], @grid[i][5] = Bishop.new([i,2], :white, self), Bishop.new([i,5], :white, self)
        @grid[i][3] = Queen.new([i,3], :white, self)
        @grid[i][4] = King.new([i,4], :white, self)
      else
        8.times {|j|@grid[i][j] = @@null }
      end
    end
  end

  def move_piece!(start_pos,end_pos)
    x, y = start_pos
    i, j = end_pos
    if @grid[x][y].nil?
      raise "No Piece Selected"
    else
      @grid[x][y].dup.position = [i,j]
      @grid[i][j] = @grid[x][y]
      @grid[x][y] = @@null

    end
  end

  def move_piece(start_pos,end_pos)
    x,y = start_pos
    i,j = end_pos
    if @grid[x][y].nil?
      raise "No Piece Selected"
    else
      piece = self[[x,y]]
      if !piece.valid_moves.include?(end_pos)
        raise "Invalid Move"
      else
        @grid[x][y].position = [i,j]
        @grid[i][j] = @grid[x][y]
        @grid[x][y] = @@null
      end
    end
  end

  def valid_pos?(pos)
    pos.each { |i| return false if i < 0 || i > 7 }
    return true
  end

  def [](position)
    x,y = position
    @grid[x][y]
  end

  def duplicate
    duped = @grid.deep_dup
    return Board.new(duped)
  end

  def checkmate?(color)
    @grid.each do |row|
      row.each do |piece|
        if piece.symbol == color
          piece.moves.each do |pos|
            duped = self.duplicate
            duped.move_piece!(piece.position, pos)
            return false if !duped.in_check?(color)
          end
        end
      end
    end
    true
  end

  def to_s
    @grid.each {|row| puts row}
  end

  def inspect
    " "
  end

  def in_check?(color)
    pos = kings_pos(color)
    ocolor = other_color(color)
    @grid.each do |row|
      row.each do |piece|
        if piece.symbol == ocolor
          return true if piece.moves.include?(pos) 
        end
      end
    end
    false
  end

  def other_color(color)
    (color == :black) ? :white : :black
  end

  def kings_pos(color)
    @grid.each do |row|
      row.each do |piece|
        return piece.position if piece.is_a?(King) && color == piece.symbol 
      end
    end
  end
end


class Array
  def deep_dup
    self.map {|ele| ele.is_a?(Array) ? ele.deep_dup : ele}
  end
end