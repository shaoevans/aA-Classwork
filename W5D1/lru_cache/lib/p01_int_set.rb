class MaxIntSet
  attr_reader :store
  def initialize(max)
    
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    store[num] = true
  end

  def remove(num)
    store[num] = false if is_valid?(num)
  end

  def include?(num)
    store[num] 
  end

  private
  

  def is_valid?(num)
    num < store.length && num >= 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % 20]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count == num_buckets
    unless include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    store_copy = Array.new(num_buckets*2) {Array.new}
    @store.each do |bucket|
      bucket.each do |num|
        store_copy[num % (num_buckets*2)] << num
      end
    end
    @store = store_copy
  end
end
