def partition(arr, num)
    first = arr.select {|ele| ele < num}
    second = arr.select {|ele| ele >= num}
    return [first,second]
end

def merge(hash1, hash2)
    results = Hash.new
    hash1.each_pair {|k, v| results[k] = v}
    hash2.each_pair {|k, v| results[k] = v}
    return results
end

/ def censor(str, arr)
    vowels = "aeiouAEIOU"
    words = str.split(" ")
    results = words.map do |word| 
end/ 

def power_of_two?(num)
    counter = 1
    (1..num).each do 
        if num == counter
            return true
        elsif counter > num
            return false
        else
            counter *= 2
        end
    end
end

