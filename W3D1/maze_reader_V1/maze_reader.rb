require "byebug"

class MazeReader
    attr_reader :grid, :currenti, :currentj
    def initialize(filepath)
        @grid = File.readlines(filepath).map {|ele| ele.chomp}
        @length = @grid.length
        @width = @grid[0].length
        @length.times do |i|
            @width.times do |j|
                if @grid[i][j] == "S"
                    @currenti = i
                    @currentj = j
                end
                @end = [i,j] if @grid[i][j] == "E"
            end
        end
    end

    def solve
        until ((@currenti == @end[0]) && (@currentj == @end[1]))
            self.move
            self.print_grid
        end
        self.print_grid
    end

    def move
        self.right? || self.up? || self.left? || self.down? 
    end

    def is_wall?(element)
        element == "*" || element == "X"
    end

    def up?
        if !self.is_wall?(@grid[@currenti-1][@currentj]) && self.is_wall?(@grid[@currenti-1][@currentj-1])
            @currenti -= 1
            @grid[@currenti][@currentj] = "X"
        end
    end

    def down?
        if !self.is_wall?(@grid[@currenti+1][@currentj]) && (self.is_wall?(@grid[@currenti+1][@currentj+1]) || self.is_wall?(@grid[@currenti][currentj+1]))
            @currenti += 1
            @grid[@currenti][@currentj] = "X"
        end
    end

    def right?
        if !self.is_wall?(@grid[@currenti][@currentj+1]) && (self.is_wall?(@grid[@currenti-1][@currentj+1]) || self.is_wall?(@grid[@currenti-1][currentj]))
            @currentj += 1
            @grid[@currenti][@currentj] = "X"
        end
    end

    def left?
        if !self.is_wall?(@grid[@currenti][@currentj-1]) && self.is_wall?(@grid[@currenti+1][@currentj-1])
            @currentj -= 1
            @grid[@currenti][@currentj] = "X"
        end
    end
    def print_grid
        @grid.each {|row| puts row}
    end

            
end

my_maze = MazeReader.new("maze1.txt")
my_maze.print_grid
p my_maze.grid[0][0]
p my_maze.is_wall?(my_maze.grid[0][0])
# debugger
my_maze.solve