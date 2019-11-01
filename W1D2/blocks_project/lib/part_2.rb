
# array.all? => returns boolean value true or false depending on whether all the elements in array satisfy condition

def all_words_capitalized?(arr)
    arr.all? {|word| word[0].upcase == word[0] && word[1..-1].downcase == word[1..-1]} 
end


def no_valid_url?(arr)
    validEndings = [".org", ".com", ".io", ".net"]
    arr.none? {|word| validEndings.include?([word.index(".")..-1])}
end

p no_valid_url?(["appacademy.io", "sennacy.com", "heyprogrammers.org"])
p no_valid_url?(["appacademy.biz", "awebsite.me"])


def any_passing_students?(arr)
    return arr.any? {|hash| average(hash[:grades]) >= 75}
end

def average(arr)
    return arr.sum/arr.length
end

