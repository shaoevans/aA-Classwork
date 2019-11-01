def some?(arr, &prc)
    arr.each {|ele| return true if prc.call(ele)}
    false
end

def exactly?(arr, num, &prc) 
    results = []
    arr.each {|ele| results << ele if prc.call(ele) }
    results.length == num
end


def filter_out(arr, &prc)
    results = []
    arr.each {|ele| results << ele if !prc.call(ele)}
    results
end

def at_least?(arr, num, &prc)
    results = []
    arr.each {|ele| results << ele if prc.call(ele) }
    results.length >= num
end

def every?(arr, &prc)
    arr.each {|ele| return false if !prc.call(ele)}
    true
end

def at_most?(arr, num, &prc)
    results = []
    arr.each {|ele| results << ele if prc.call(ele) }
    results.length <= num
end

def first_index(arr, &prc)
    arr.each_with_index {|ele, ind| return ind if prc.call(ele)}
    nil
end

def xnor_select(arr, prc1, prc2)
    results = []
    arr.each { |ele| results << ele if prc1.call(ele) == prc2.call(ele)}
    results
end


def filter_out!(arr, &prc)
    arr.each_with_index {|ele, ind| arr[ind] = nil if prc.call(ele)}
    arr.delete(nil)
    arr
end

def multi_map(arr, n=1, &prc)
    results = arr
    n.times do 
        results = results.map {|ele| prc.call(ele)}
    end
    results
end

def proctition(arr, &prc)
    trueArray = []
    falseArray = []
    arr.each do |ele|
        if prc.call(ele)
            trueArray << ele
        else
            falseArray << ele
        end
    end
    trueArray.concat(falseArray)
    trueArray
end

def selected_map!(arr, prc1, prc2) 
    arr.each_with_index {|ele, int| arr[int] = prc2.call(ele) if prc1.call(ele)}
    nil
end

def chain_map(num, arr) 
    result = num
    arr.each do |ele|
        result = ele.call(result)     
    end  
    result
end

def proc_suffix(str, hash)
    words = str.split(" ")
    words.each_with_index do |word, ind|
        temp = ""
        hash.each_pair do |k, v|
            if k.call(word)
                temp += v         
            end
        end
        words[ind] = word + temp
    end
    return words.join(' ') 
end

def proctition_platinum(arr, *prcs) 
    results = Hash.new {|hash, key| hash[key] = []}
    num = prcs.length
    prcs.each_with_index do |prc, ind|
        arr.each do |ele|
            if prc.call(ele)
                results[ind+1] << ele
            end
        end
    end
    results
end

def procipher(str, hash)
    words = str.split(' ')   
    words.each_with_index do |word, ind|
        temp = word
        change = false
        hash.each_pair do |k, v| 
            if k.call(word) 
                temp = v.call(temp)
                change = true
            end
        end
        if change 
            words[ind] = temp
            change = false
        end
    end
    return words.join(' ')
end

def picky_procipher(str, hash) 
    words = str.split(' ')
    words.each_with_index do |word, idx|
        hash.each_pair do |k, v|
            if k.call(word) 
                words[idx] = v.call(word)
                break
            end
        end
    end
    words.join(' ')
end



is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
make_question = Proc.new { |s| s + '???' }
reverse = Proc.new { |s| s.reverse }
add_smile = Proc.new { |s| s + ':)' }

p picky_procipher('he said what!',
    is_yelled => make_question,
    contains_a => reverse
) # "he dias what!???"

p picky_procipher('he said what!',
    contains_a => reverse,
    is_yelled => make_question
) # "he dias !tahw"

p picky_procipher('he said what!',
    contains_a => reverse,
    is_yelled => add_smile
) # "he dias !tahw"

p picky_procipher('stop that taxi now',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "stop that??? taxi??? now"

p picky_procipher('STOP that taxi!',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "STOP:) that??? !ixat"






