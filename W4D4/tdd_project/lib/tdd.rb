class Array

  def my_uniq
    results = []
      self.each { |ele| results << ele if !results.include?(ele) }
    results
  end

  def two_sum
    pairs = []
    (0...self.length).each do |i|
      (i+1...self.length).each do |j|
        pairs << [i,j] if self[i] + self[j] == 0
      end
    end
    pairs
  end


end

def my_transpose(arr) 
  raise ArgumentError if !arr.is_a?(Array)
  return arr if arr.empty?
  raise IndexError if arr.map(&:length).uniq.length != 1
  results = Array.new(arr[0].length) {Array.new(arr.length)}
  arr.each_with_index do |sub, i|
    sub.each_with_index do |ele, j|
      results[j][i] = arr[i][j]
    end
  end
  results
end

def stock_picker(arr)
  raise ArgumentError if !arr.is_a?(Array)
  max_diff = 0
  pair = nil
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
      if arr[j] - arr[i] > max_diff
        max_diff = arr[j] - arr[i]
        pair = [i,j]
      end
    end
  end
  pair
end


  # 1. make sure argument is an array
  # 2. returns days on which price diff is greatest (indices)
  # 3. sell date must be greater than purchase date
  # 4. should return nil if no days profitable
  # 5. return first day pair if multiple days have same max diff
