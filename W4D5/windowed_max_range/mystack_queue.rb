require_relative "mystack"

class MyStackQueue
  def initialize 
    @stack1 = MyStack.new
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
end

mys = MyStackQueue.new

mys.enqueue(5)
mys.enqueue(7)
mys.enqueue(9)
mys.enqueue(5)
mys.enqueue(7)
mys.enqueue(9)