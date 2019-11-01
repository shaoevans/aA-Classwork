class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Enter a position with a space between the numbers like '1 0'"
        input = gets.chomp.split(" ").map {|ele| ele.to_i}
        if input.length != 2
            raise "Invalid Position Given"
        else
            input
        end
    end
end
