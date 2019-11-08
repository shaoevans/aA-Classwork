class MinMaxStack
  def initialize
    @stack = []
    @maxes = []
    @mins = []
  end

  def push(ele)
    @stack.push(ele)
    if @maxes.empty? || ele >= self.max
      @maxes << ele
    end
    if @mins.empty? || ele <= self.min
      @mins << ele 
    end
  end

  def pop
    if self.peek == self.max
      @maxes.pop
    end
    if self.peek == self.min
      @mins.pop      
    end
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

  def max
    return @maxes[-1] if !@maxes.empty?
    0
  end

  def min
    return @mins[-1] if !@mins.empty?
    0
  end


end