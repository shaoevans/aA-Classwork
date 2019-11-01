def duos(str)
    count = 0
    str.each_char.with_index do |char, ind|
        count += 1 if char == str[ind+1]
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(str, hash)
    words = str.split(" ")
    words.map! {|word| !hash[word].nil? ? hash[word] : word}
    words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc1, &prc2)
    answer = Hash.new
    hash.each do |key, val|
        answer[prc2.call(key)] = prc1.call(val)
    end
    answer
end


# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
    answer = []
    hash = Hash.new(0)
    words = str.split(" ")
    words.each do |word|
        word.each_char{|char| hash[char] += 1}
    end
    hash.select {|key, val| val > 2}.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
    letters = str.split("")
    answer = false
    (0..letters.length-2).each do |i|
        if letters[i] == letters[i+1] && letters[i] == letters[i+2] 
            answer = true
        end
    end
    answer 
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false
# p triplet_true("aabbcc")         # false

def energetic_encoding(str, hash)
    chars = str.split("")
    chars.map! {|char| char == " " ? char : !hash[char].nil? ? hash[char] : "?"}
    chars.join("")
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    i=0
    ans = ""
    while i < str.length-1
        str[i+1].to_i.times do
            ans += str[i]
        end
        i += 2
    end
    ans
end


# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *prcs)
    arr.select { |num| prcs.all?{|prc| prc.call(num)} }
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sentence)
    vowels = "aeiouAEIOU"
    words = sentence.split(" ")
    words.map! do |word|
        if word.length < 3
            word
        else
            if vowels.include?(word[0])
                word + "yay"
            else
                separate = word.split(/([aeiou].*)/)
                separate[1] + separate[0] + "ay"
            end
        end
    end
    words.join(" ")
end


# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sentence)
    vowels = "aeiouAEIOU"
    words = sentence.split(" ")
    words.map! do |word|
        if word.length < 3
            word 
        elsif vowels.include?(word[-1])
            word + word
        else
            parts = word.reverse.split(/([aeiou].*)/)
            lastpart = parts[1][0] + parts[0].reverse
            word + lastpart
        end
    end
    words.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
    arr.select {|ele| prcs.any? {|prc| prc.call(ele)}}
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(str)
    words = str.split(" ")
    results = []
    words.each_with_index do |word, ind|
        if !"aeiou".include?(word)
            results << word
        elsif ind.odd?
            temp = ""
            idx = (word.length - 1) - word.reverse.index(/[aeiou]/)
            temp = word[0...idx] + word[idx+1..-1]
            results << temp
        else
            temp = ""
            idx = word.index(/[aeiou]/)
            temp = word[0...idx] + word[idx+1..-1]
            results << temp
        end
    end
    results.join(" ")
end



# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sentence)
    words = sentence.split(" ")
    vowels = "aeiouAEIOU"
    words.map! do |word|
        if vowels.include?(word[-1])
            word + word[-1]
        else
            temp = ""
            word.each_char do |char|
                if vowels.include?(char)
                    temp += char + "b" + char.downcase
                else
                    temp += char
                end
            end
            temp
        end
    end 
    words.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str)
    results = []
    count = 1
    str.each_char.with_index do |char, ind|
        if str[ind+1].nil?
            results << char
        elsif char == str[ind+1]
            count += 1
        else 
            results << char
            results << count
            count = 1
        end
    end
    results.delete(1)
    results.join("")
end


p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"
