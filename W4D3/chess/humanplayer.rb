class HumanPlayer
  def initialize(name, board, color)
    @name = name
    @display = Display.new(board)
    @color = color
    @board = board
  end

  def make_move
    begin 
      turn1 = true
      @display.render
      puts "#{@color} move"
      input1 = @display.get_input

      until !input1.nil?
        @display.render
        puts "#{@color} move"
        input1 = @display.get_input
      end
      if @board[input1].symbol != @color
        puts "wrong side"
        raise ""
      end
      turn1 = false
      @display.render
      puts "#{@color} move"
      input2 = @display.get_input
      until !input2.nil?
        @display.render
        puts "#{@color} move"
        input2 = @display.get_input
      end
      @board.move_piece(input1, input2)
    rescue 
      @display.select_change if turn1

      retry
    end
  end

end
