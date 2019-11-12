class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index do |ele, idx| 
      # result += ele.object_id
      result += idx.hash * ele.hash
    end
    result
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    result = 0
    self.each_char.with_index do |ele, idx| 
      # result += ele.object_id
      result += idx.hash * alphabet.index(ele).hash
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |k, v|
      result += k.hash * v.hash
    end
    result
  end
end
