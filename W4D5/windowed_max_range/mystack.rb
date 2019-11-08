class MyStack
  def initialize
    @stack = []
  end

  def push(ele)
    @stack.push(ele)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end

  def empty?
    @stack.empty?
  end

  def size
    @stack.length
  end
end