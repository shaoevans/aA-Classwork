class Player
    def get_move
        p "enter a position with coordinates separated with a space like `4 7'"
        inputs = gets.chomp.split(" ")
        inputs.map! {|ele| ele.to_i}
    end
end
