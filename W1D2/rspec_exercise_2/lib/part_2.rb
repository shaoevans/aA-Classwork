def palindrome?(str)
    temp = str
    backwards = ""
    
    str.size.times do
         backwards << str.pop
    end
    return temp == backwards
end