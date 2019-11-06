require_relative "piece.rb"
require "byebug"
class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    self.populate
  end

  def populate
    8.times do |i|
      if i == 0 || i == 1 || i == 6 || i == 7
        8.times do |j|
          @grid[i][j] = Piece.new
            # else
            #   @grid[i].each {|col| row << nil }
          end
      end
    end
  end

  def move_piece(start_pos,end_pos)
    row, column = start_pos[0], start_pos[1]
    if @grid[row][column].nil?
      raise "No Piece Selected"
      # row = 0, column = 9
    elsif row > 8 || row < 0 || column > 8 || column < 0
      raise "Cannot move there"
    else
      @grid[end_pos[0]][end_pos[1]] = @grid[row][column]
      @grid[row][column] = nil
    end
  end

end

