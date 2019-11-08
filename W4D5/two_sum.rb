require "byebug"

def bad_two_sum?(arr, target_sum)
  arr.length.times do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
      break if target_sum > sorted[i] + sorted[j]
      return true if sorted[i] + sorted[j] == target_sum
    end
  end
  false
end

def two_sum?(arr, target_sum)
  hash = Hash.new(false)
  arr.each do |num|
    return true if hash[target_sum -num]
    hash[num] = true
  end
  false
end

# def four_sum?(arr, target_sum)
#   (0..target_sum/2).each do |i|
#     return true if two_sum?(arr, i) && two_sum?(arr, target_sum-i)
#   end
# end


def four_sum?(arr, target_sum)
  hash2, hash3 = Hash.new {|h,k| h[k] = []}, Hash.new {|h,k| h[k] = []}
  arr.length.times do |i|
    (i+1...arr.length).each do |j|
      sum = arr[i] + arr[j]
      hash2[sum] << arr[i]
      hash2[sum] << arr[j]
    end
  end
  arr.each do |ele|
    hash2.each do |k,v|
      if !v.include?(ele)
        hash3[ele + k] = v + [ele]
      end
    end
  end
  arr.each {|ele| return true if hash3.has_key?(target_sum - ele) && !hash3[target_sum-ele].include?(ele)}
  false
end

arr = [0, 1, 5, 7]
debugger
p four_sum?(arr, 12)
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
# hash = Hash.new(0)
# hash[i[0]+j] = i << j
# hash.each do |