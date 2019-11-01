def reverser(str, &prc)
    return prc.call(str.reverse)
end

def word_changer(str, &prc)
    results = []
    words = str.split(" ")
    words.each_with_index {|word, ind| results << prc.call(word)}
    return results.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    return [prc1.call(num), prc2.call(num)].max
end

def and_selector(arr, prc1, prc2)
    arr.select {|ele| prc1.call(ele) && prc2.call(ele)}
end

def alternating_mapper(arr, prc1, prc2)
    results = []
    arr.each_with_index do |ele, ind| 
        if ind % 2 == 0 
            results << prc1.call(ele)
        else
            results << prc2.call(ele)
        end
    end
    return results
end