class ComputerPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        input = legal_positions[rand(0...legal_positions.length)]
        p @mark
        p input
    end
end