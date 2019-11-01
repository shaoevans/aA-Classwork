def proper_factors(num)
    results = []
    (1...num).each {|ele| results << ele if num % ele == 0}
    results
end

def aliquot_sum(num) 
    return proper_factors(num).inject {|accum, ele| accum + ele}
end

def perfect_number?(num)
    aliquot_sum(num) == num
end


###

def ideal_numbers(n)
    results = []
    counter = 1
    n.times do 
        counter += 1
        while !perfect_number?(counter) 
            counter += 1
        end
        results << counter 
    end
    results 
end