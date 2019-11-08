def my_min(arr)
  min = arr[0]
  arr.each {|ele| min = ele if ele < min}
  min
  # arr.each do |ele1|
  #   return ele1 if arr.all? {|ele2| ele1 <= ele2}
  # end
end

# def largest_contiguous_subsum(arr)
#   results = []
#   (0...arr.length).each do |i|
#     (i...arr.length).each do |j|
#       results << arr[i..j]
#     end
#   end
#   max = 0
#   results.each do |array|
#     max = array.sum if array.sum > max
#   end
#   p results
#   max
# end

def largest_contiguous_subsum(arr)
  sum = 0
  arr.each do |num|
    if num + sum > 0
      sum += num 
    else
      sum = 0
    end
  end
  sum
end

list = [2, 3, -6, 7, -8, 7]
p largest_contiguous_subsum(list) # => 8
