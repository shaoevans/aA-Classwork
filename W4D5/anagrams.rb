def first_anagram(str1, str2)
  anagrams = str1.split("")
  anagrams = anagrams.permutation.to_a
  anagrams.map! {|arr| arr.join("")}
  anagrams.include?(str2)
end

def second_anagram(str1, str2)
  return true if str1.empty? && str2.empty?
  return false if str1.length != str2.length
  first = str1[0]
  i = str2.index(first)
  return false if i == nil
  str2.slice!(i)
  second_anagram(str1[1..-1], str2)
end

def third_anagram(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def fourth_anagram(str1, str2)
  hash1, hash2 = Hash.new(0), Hash.new(0)
  str1.each_char {|c| hash1[c] += 1}
  str2.each_char {|c| hash2[c] += 1}
  hash1 == hash2
end

def fifth_anagram(str1,str2)
  hash = Hash.new(0)
  str1.each_char {|c| hash[c] += 1}
  str2.each_char {|c| hash[c] -= 1}
  hash.values.all? {|v| v.zero?}
end

p fifth_anagram("gizmo", "sally")   #=> false
p fifth_anagram("elvis", "lives")    #=> true