require "byebug"

class Board
    attr_reader :size, :num_ships
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n ** 2
        @num_ships = 0
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
        @num_ships += 1
    end

    def attack(position)
        if self[position ]== :S 
            self[position] = :H
            p "you sunk my battleship!"
            true
        else 
            self[position] = :X
            false
        end
    end

    def place_random_ships
        ships_left = (@size/4)
        while ships_left != 0
            x = rand(0...@grid.length)
            y = rand(0...@grid.length)
            if @grid[x][y] != :S 
                @grid[x][y] = :S
                ships_left -= 1
                @num_ships += 1
            end
        end
    end


    def hidden_ships_grid
        l = @grid.length
        results = Array.new(l) {Array.new(l)}
        results.length.times do |i|
            results.length.times do |j|
                (@grid[i][j] == :S) ? results[i][j] = :N : results[i][j] = @grid[i][j]
            end
        end
        results
    end

    def self.print_grid(matr)
        matr.each {|row| puts row.join(" ")}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
