


def my_reject(arr, &prc) 
    results = []
    arr.each {|ele| results << ele if !prc.call(ele)}
    results
end



# define method = my_
# arguments = 1 array and block as input
# unless every ele returns true, method should return false

def my_one?(array, &prc)
    results = array.select {|ele| prc.call(ele)}
    return 1 == results.length
end

#########

# #hash and block as argument

def hash_select(hash, &prc)
    results = Hash.new(0)
    hash.each_pair {|k, v| results[k] = v if prc.call(k,v)}
    results
end

def xor_select(arr, prc1, prc2)
    results = []
    arr.each do |ele|
        if (prc1.call(ele) && !prc2.call(ele)) || (prc2.call(ele) && !prc1.call(ele))
            results << ele
        end
    end
    
    results
end

#arg = value and array containing proc objects
#return number counting instances of proc returning true

def proc_count(val, arr) 
    count = 0
    arr.each { |ele| count += 1 if ele.call(val) }
    count
end