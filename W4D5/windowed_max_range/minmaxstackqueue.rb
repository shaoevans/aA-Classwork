require_relative "minmaxstack"
require_relative "mystack"
class MinMaxStackQueue
  def initialize 
    @stack1 = MinMaxStack.new
    @stack2 = MyStack.new
  end

  def enqueue(ele)
    @stack1.push(ele)
  end

  def dequeue
    until self.size == 1
      @stack2.push(@stack1.pop)
    end
    last = @stack1.pop
    until @stack2.empty?
      @stack1.push(@stack2.pop)
    end
    last
  end

  def size
    @stack1.size
  end
  
  def empty?
    @stack1.empty?
  end

  def max  
    @stack1.max
  end

  def min
    @stack1.min
  end

  def range
    self.max - self.min
  end

end

