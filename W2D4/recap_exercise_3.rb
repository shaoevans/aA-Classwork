require "byebug"
def no_dupes?(arr)
    counter = Hash.new(0)
    results = []

    arr.each { |ele| counter[ele] += 1}
    counter.select {|k,v| v == 1}
            .keys
end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    (0...arr.length-1).each { |i| return false if arr[i] == arr[i+1] }
    true
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new { |h,k| h[k] = [] }

    str.each_char.with_index { |char, i| hash[char] << i }
    hash
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    longest = ""
    temp = ""
    (0...str.length).each do |i|
        if str[i] == str[i+1] && !str[i+1].nil?
            temp += str[i]
        else
            temp += str[i]
            longest = temp if longest.length <= temp.length
            temp = ""
        end
    end
    longest
end


# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


def bi_prime?(num)
    (2...num).each do |i|
        if num % i == 0
            pair = [i, num / i]
            mapped = pair.map { |ele| prime?(ele) }
            if mapped.all? { |ele| ele == true }
                return true
            end
        end
    end
    false
end

def prime?(n)
    return false if n < 2

    (2...n).each do |i|
        if n % i == 0
            return false
        end
    end
    true 
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(str, arr)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    results = ""
    str.each_char.with_index do |char, i|
        ind = (alphabet.index(char) + arr[0]) % 26
        results += alphabet[ind]
        arr.rotate!
    end
    results
end

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t

# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
    vowels = 'aeiou'
    my_vowels = []

    str.each_char { |char| my_vowels << char if vowels.include?(char) }
    my_vowels.unshift(my_vowels.pop)
    str.each_char.with_index { |char, i| str[i] = my_vowels.shift if vowels.include?(char) }
    str
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"



class String
    
    def select(&prc)
        return "" if prc.nil?
        results = ""
        self.each_char {|char| results += char if prc.call(char)}
        results
    end        

# Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""


    def map!(&prc)
        self.each_char.with_index { |char, i| self[i] = prc.call(char, i) }
    end
end

   # Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa" 

def multiply(num1, num2)
    return 0 if num1 == 0 || num2 == 0
    if num1 > 0
        num2 + multiply(num1-1, num2)
    else
        -num2 + multiply(num1+1, num2)
    end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2,1] if num == 2
    return lucas_sequence(num-1) + [lucas_sequence(num-1)[-1] + lucas_sequence(num-1)[-2]]
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    return [num] if prime?(num)
    [2,3,5].each do |factor|
        if num % factor == 0
            return [factor] + prime_factorization(num / factor)
        end
    end
end

# Examples
# prime_factorization[12] + prime_factorization(6)
# prime_factorization(6) => [2] + prime_factorization(3)
# prime_factorization(3) => 3
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]


