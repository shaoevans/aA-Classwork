require "singleton"
require "byebug"
require "colorize"

class Hanoi
  attr_reader :board
  attr_accessor :spoke1, :spoke2, :spoke3
  def initialize
    @spoke1 = Stack.new
    @spoke2 = Stack.new
    @spoke3 = Stack.new
    spoke1.populate
    @board = [spoke1, spoke2, spoke3]
  end

  def play
    until game_over?
   
      self.render
      begin
      puts "enter a start and end spoke separated by a comma like this '1,1'"
      input = gets.chomp.split(",").map(&:to_i)
      start,fin = input
      self.move(@board[start], @board[fin])
      rescue InvalidMoveError
        puts "Invalid Move! Try Again"
        retry
      end
    end
    self.render
    puts "🎉🎉🎉🎉CONGRAGULATIONS!!🎉🎉🎉🎉"
  end

  def game_over?
    finished = [1,2,3]
    (@spoke2.stack.map {|ele| ele.val} == [1,2,3]) || (@spoke3.stack.map {|ele| ele.val} == [1,2,3])
  end


  def move(start_spoke,end_spoke)
    disk = start_spoke.pop
    if !end_spoke.unshift(disk)
      start_spoke.unshift(disk)
      raise InvalidMoveError
    end
  end

  def render
    system("clear")
    @board.length.times do |i|
      puts "||".center(32).colorize(:yellow) + "||".center(32).colorize(:yellow) + "||".center(32).colorize(:yellow)
      # puts "||".center(32).colorize(:yellow) + "||".center(32).colorize(:yellow) + "||".center(32).colorize(:yellow)
      row = @board.map {|spoke| spoke.stack[i].to_s.center(32)}
      puts "       " +row.join(' ')     
    end
     puts "▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬".colorize(:yellow)
  end
 
end

class Stack
  attr_reader :stack
  def initialize(n=3)
    @stack = Array.new(n, NullDisk.instance)
  end
  
  def populate
    @stack.length.times {|i| @stack[i] = Disk.new(i+1)}
  end

  def pop
    value = nil
    @stack.length.times do |i|
      if !@stack[i].is_a?(NullDisk)
        value = @stack[i]
        @stack[i] = NullDisk.instance
        break
      end
    end
    value
  end

  def unshift(disk)
    if @stack.all? { |ele| ele.is_a?(NullDisk) }
      @stack[-1] = disk
      return true
    end
    @stack.length.times do |i|
      if !@stack[i].is_a?(NullDisk)
        if disk.val < @stack[i].val 
          @stack[i-1] = disk
          return true
        end
      end
    end
    false
  end
end

class Disk
  COLORS = {3 => :blue, 2=> :red, 1=> :green}
  attr_reader :val
  def initialize(val=nil)
    @val = val
  end

  def to_s
    str = ""
    base = "▀▀▀▀"
    @val.times {str += base}
    # str.center(32).colorize(COLORS[self.val])
    str.colorize(COLORS[self.val])
  end
end

class NullDisk < Disk
  include Singleton

  def to_s
    ""
  end
end

class InvalidMoveError < StandardError

end 


hanoi = Hanoi.new
hanoi.play