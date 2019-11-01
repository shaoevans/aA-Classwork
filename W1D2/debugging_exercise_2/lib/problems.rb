
require "byebug"
def largest_prime_factor(num)
    results = []
    (2..num).each do |i|
        if num % i == 0 && prime?(i)
            results << i
        end
    end
    results[-1]
end

def prime?(num)
    return false if num < 2 
    return true if num == 2
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    return true
end


def unique_chars?(str)
    results = Hash.new(0)        
    str.each_char do |i|
        results[i] += 1
    end
    
    results.each_value do |x|
        return false if x > 1
    end

    return true
end



def dupe_indices(arr)
    counter = Hash.new(0)
    results = Hash.new()
    arr.each do |ele|
        counter[ele] += 1
    end
    counter.each_key do |k|
        if counter[k] > 1
            temp = []
            arr.each_with_index do |ele, ind|
                if ele == k 
                    temp << ind
                end
            end
            results[k] = temp
        end
    end
    return results
end

    
            

# accepts 2 arrays as inputs
# returns true or false
# return true if arrays contain same elements
# return false if arrays contain differnet elements




def ana_array(arr1, arr2) 
    counter1 = Hash.new(0)
    counter2 = Hash.new(0)

    arr1.each do |ele|
        counter1[ele] += 1
    end

    arr2.each do |ele|
        counter2[ele] += 1
    end

    counter1.each_key do |key|
        if counter2.key?(key) 
            if counter2[key] != counter1[key]
                return false
            end
        else 
            return false
        end  
    end
    
    counter2.each_key do |key|
        if counter1.key?(key) 
            if counter1[key] != counter2[key]
                return false
            end
        else 
            return false
        end  
    end
    return true
    
end
p ana_array(["cat"], ["cat", "dog"])
p ana_array(["cat", "dog"], ["cat"])
p ana_array(["i","c","e","m","a","n"], ["c","i","n","e","m","a"])
# iterate through every key of counter1
# for every key of counter1, check if counter2 contains that key
# if counter2 does not have key, return false
# if counter2 has key, we check if values are the same
