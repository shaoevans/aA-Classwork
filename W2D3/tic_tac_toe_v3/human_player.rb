class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        correct = false
        while !correct
            p "Enter a position with a space between the numbers like '1 0'"
            input = gets.chomp.split(" ").map {|ele| ele.to_i}
            if !legal_positions.include?(input)
                raise "Invalid Position Given"
            else
                input
                correct = true
            end
        end
    end
end
