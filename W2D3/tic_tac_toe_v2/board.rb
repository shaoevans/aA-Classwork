require "byebug"
class Board
    def initialize(n)
        @board = Array.new(n) {Array.new(n, '_')}
        @length = n
    end

    def valid?(position)
        position[0] < @length && position[1] < @length
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
        d1 = (0...@length).collect {|i| @board[i][i]}

        d2 = (0...@length).collect {|i| @board[(@length-1)-i][i]}

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

