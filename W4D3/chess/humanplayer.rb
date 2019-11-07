class HumanPlayer
  def initialize(name, board, color)
    @name = name
    @display = Display.new(board)
    @color = color
    @board = board
  end

  def make_move
    begin 
      @display.render
      input1 = @display.get_input
      until !input1.nil?
        @display.render
        input1 = @display.get_input
      end
      if @board[input1].symbol != @color
        puts "wrong side"
        raise ""
      end
      @display.render
      input2 = display.get_input
      until !input.nil?
        @display.render
        input2 = @display.get_input
      end

      @board.move_piece(input1, input2)
    rescue 
      @display.select_change
      retry
    end
  end

end
