require_relative "minmaxstackqueue"
require "byebug"
# def windowed_max_range(arr, window_size)
#   current_max_range = 0
#   arr.length.times do |i|
#     current = arr[i...i+window_size]
#     max, min = current.max, current.min
#     current_max_range = max - min if max - min > current_max_range
#   end
#   current_max_range
# end

def windowed_max_range(arr, window_size)
  range_finder = MinMaxStackQueue.new
  window_size.times do |i|
    range_finder.enqueue(arr[i])
  end
  max_current_range = range_finder.range
  arr[window_size..-1].each do |ele|
    range_finder.dequeue
    range_finder.enqueue(ele)
    max_current_range = range_finder.range if range_finder.range > max_current_range
  end
  max_current_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8