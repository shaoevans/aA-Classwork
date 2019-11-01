require_relative "code"

class Mastermind
    def initialize(num)
        @secret_code = Code.random(num)
    end

    def print_matches(code)
        puts @secret_code.num_exact_matches(code)
        puts @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        p "Enter a code"
        
        input = Code.from_string(gets.chomp)
        print_matches(input)
        if @secret_code == input
            true
        else
            false
        end
    end
    
end
