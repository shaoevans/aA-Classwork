require 'byebug'
def zip(*arrs)
    results = []
    (0...arrs[0].length).each do |idx|
        temp = []
        arrs.each do |j|         
            temp << j[idx]
        end
        results << temp
    end
    results    
end

def prizz_proc(arr, prc1, prc2)
    arr.select { |ele| prc1.call(ele) != prc2.call(ele) }
end

def zany_zip(*arrs)
    results = []
    l = arrs.map { |ele| ele.length  }.max
    (0...l).each do |idx|
        temp = []
        arrs.each do |j|
            if idx < j.length      
                temp << j[idx]
            else
                temp << nil
            end
        end
        results << temp
    end
    results
end

def maximum(arr, &prc)
    return nil if arr.empty?
    arr.inject do |accum, ele|
        if prc.call(ele) >= prc.call(accum)
            ele
        else
            accum
        end
    end
end

def my_group_by(arr, &prc)
    answer = Hash.new {|hash, key| hash[key] = []}
    arr.each { |ele| answer[prc.call(ele)] << ele }
    answer
end

def max_tie_breaker(arr, prc1, &prc2)
    return nil if arr.empty?
    arr.inject do |accum, ele|
        if prc2.call(ele) > prc2.call(accum)
            ele
        elsif prc2.call(ele) == prc2.call(accum) && prc1.call(ele) > prc1.call(accum)
            ele
        else
            accum
        end
    end
end

def silly_syllables(str)
    answer = []
    str.split(" ").each do |word|
        word.count("aeiou") >= 2 ? answer << word.split(/([aeiou].*)/)[1].reverse.split(/([aeiou].*)/)[1].reverse : answer << word
    end
    answer.join(" ")
end


# def silly_syllables(str)
#     vowels = "aeiouAEIOU"
#     answer = []
#     str.split(" ").each do |word|
#         vowelCount = word.count(vowels) 
#         if vowelCount >= 2
#             #method that return an arr with the idx of the first and the last value
#             indexes = indexFinder(word) 
#             answer << word[indexes[0]..indexes[1]]
#         else
#             answer << word
#         end
#     end
#     answer.join(" ")
# end


# def indexFinder(word)
#     vowels = "aeiouAEIOU"
#     first = -1
#     last = 0
#     word.each_char.with_index do |char, ind|
#         if vowels.include?(char)
#             first = ind if first == -1
#             last = ind            
#         end
#     end
#     [first, last]
# end



