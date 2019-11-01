require "set"
require_relative "player"
require_relative "aiplayer"
require "byebug"

class Game
    @@dictionary = Set.new(File.readlines("dictionary.txt").map {|word| word.chomp})

    attr_reader :current_player, :fragment
    def initialize(opts = {})
        @players = []

        opts.each do |k,v|
            if v 
                @players << AIPlayer.new
            else
                @players << Player.new(k)
            end
        end
            # {|name| @players << Player.new(name)}
        @static_players = @players.dup
        @current_player = @players[0]
        @fragment = ""
    end

    def dictionary
        @@dictionary
    end

    def next_player!
        @current_player = @players.rotate!(1)[0]
    end

    def valid_play?(str)
        alphabet = ("a".."z").to_a
        alphabet.include?(str) && @@dictionary.to_a.any? {|word| word[0...@fragment.length+1] == @fragment + str}
    end

    def take_turn(player)
        letter = player.get_letter(self.winning_moves)
        while !valid_play?(letter)
            p "not a valid letter, try again"
            letter = player.get_letter(self.winning_moves)
        end
        @fragment += letter
        p @fragment
        if @@dictionary.include?(@fragment)
            @players.each {|player| player.losses += 1 if @current_player != player}
            @@dictionary.delete(@fragment)
            return false
        end
        true
    end

    def winning_moves
        results = ("a".."z").to_a.select do |char| 
            (@@dictionary.to_a.count {|word| word[0...@fragment.length+1] == @fragment + char} <= 4) && valid_play?(char)
        end
        results
    end
        

    def losses(player)
        string = "GHOST"
        string[0...player.losses]
    end

    def display_standings
        @static_players.each {|player| puts "Player #{player.name}: #{losses(player)}"}
    end

    def play_round
        while self.take_turn(@current_player)
            self.next_player!
        end
        self.display_standings
        @fragment = ""
    end


    def run 
        until @players.any? {|player| player.losses == 5}
            self.play_round
        end
        p "Game_over, #{@current_player.name} has won!"
    end
end

players = {"Kyle" => false, "Evans" => true}

machine_civil_war = Game.new(players)

machine_civil_war.run
#aardvark
 