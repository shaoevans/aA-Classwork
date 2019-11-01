def element_count(arr)
    count = Hash.new(0)

    arr.each do |ele|
        count[ele] +=1
    end
    
    count
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, index|
        if hash.has_key?(char)
            str[index] = hash[char]
        else
            str[index] = char
        end
    end  
    str
end

def product_inject(arr)
    arr.inject { |accum, ele| accum * ele}
end
