require_relative "cursor.rb"
require "colorize"

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def colors_for(i, j, symbol)
    if [i, j] == @cursor.cursor_pos 
      if @cursor.selected
        bg = :green
      else
        bg = :light_red
      end
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: symbol }
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j, piece.symbol)
      piece.to_s.colorize(color_options)
    end
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def render
    system("clear")
    build_grid.each {|row| puts row.join}
  end

  def get_input
    @cursor.get_input
  end

  def select_change
    @cursor.select_change
  end


end