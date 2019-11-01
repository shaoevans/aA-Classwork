class Player
    attr_reader :name
    attr_accessor :losses
    def initialize(name)
        @losses = 0
        @name = name
    end

    def get_letter(letters)
        p "Enter a letter"
        letter = gets.chomp
    end


end