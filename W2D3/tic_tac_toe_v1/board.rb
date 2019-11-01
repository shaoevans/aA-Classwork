
class Board
    def initialize
        @board = Array.new(3) {Array.new(3, '_')}
    end

    def valid?(position)
        position[0] < 3 && position[1] < 3
    end

    def [](position)
        @board[position[0]][position[1]]
    end

    def []=(position, mark)
        @board[position[0]][position[1]] = mark
    end

    def empty?(position)
        self[position] == "_"
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            self[position] = mark
        else
            raise "Not a valid position"
        end
    end

    def print
        @board.each {|row| puts row.join(" ")}
    end

    def win_row?
        @board.each do |row|
            if row.uniq.size == 1 && !row.uniq.include?('_')
                return true
            end
        end
        false
    end

    def win_col?
        @board.transpose.each do |row|
            if row.uniq.size == 1 && !row.uniq.include?('_')
                return true
            end
        end
        false
    end

    def win_diagonal?
        d1 = [@board[0,0], @board[1,1], @board[2,2]]
        d2 = [@board[2,0], @board[1,1], @board[0,2]]
        [d1,d2].each do |row|
            if row.uniq.size == 1 && !row.uniq.include?('_')
                return true
            end
        end
        false
    end

    def win?
        win_col? || win_diagonal? || win_row?
    end

    def empty_positions?
        @board.flatten.include?('_')
    end

end
