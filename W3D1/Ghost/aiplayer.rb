class AIPlayer
    attr_reader :name
    attr_accessor :losses
    def initialize
        @name = "AIPlayer"
        @losses = 0
    end

    def get_letter(winning_moves)
        if winning_moves.empty?
            ("a".."z").to_a.sample
        else
            winning_moves.sample
        end
    end
end