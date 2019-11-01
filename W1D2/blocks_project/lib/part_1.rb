
def select_even_nums(arr)
    return arr.select{|num| num % 2 == 0}
end


def reject_puppies(arr)
    return arr.reject{|dog| dog["age"] <= 2} 
end

# accepts 2D array as input
# output is an integer that counts how many subarrays had a sum of > 0 

def count_positive_subarrays(arr) 
    return arr.count{|ele| ele.sum > 0}
end


# accepts string as input
# output is string that has a b + vowel after every vowel 


def aba_translate(str)
    counter = 0
    vowels = "aeiouAEIOU"
    str.each_char.with_index do |char, ind|
        if vowels.include?(char)
            str.insert(ind + 1 + counter, "b" + char)
            counter += 2
        end
    end
end

# accepts array of words as input
# outputs an array of aba translated words


def aba_array(arr)
    return arr.map{|word| aba_translate(word)}
end



