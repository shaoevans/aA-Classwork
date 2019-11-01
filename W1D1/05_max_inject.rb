# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

def compress_str(str)
    results = []
    counter = 1
    str.each_char.with_index do |char, ind|
       if char = str[ind+1]
            counter += 1
       else 
            results << counter
            results << char
            counter = 1
       end
    end
    return results.join(',')
end

p compress_str("aaabbc")   # => "3a2bc"
