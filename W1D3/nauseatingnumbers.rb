require "byebug"
def strange_sums(arr)
    count = 0
    arr.each_with_index do |ele1, ind1|
        arr.each_with_index do |ele2, ind2|
            if ind2 > ind1
                count += 1 if ele1 + ele2 == 0 
            end
        end
    end
    count
end


def pair_product(arr, n)
    arr.each_with_index do |ele1, ind1|
        arr.each_with_index do |ele2, ind2|
            if ind2 > ind1
                return true if ele1 * ele2 == n
            end
        end
    end
    false
end


def rampant_repeats(str, hash)
    repeated = ""
        str.each_char do |char|
            if hash.has_key?(char)
                hash[char].times {repeated += char} 
            else
                repeated += char
            end
        end
    repeated
end

def perfect_square(num)
    temp = 0
    current = 0

    num.times do
        temp += 1
        current = temp * temp
        if num == current
            return true
        elsif num < current
            return false
        end
    end
end

def anti_prime?(num)
    (1...num).none? {|i| divisors(i) > divisors(num)}
end

def divisors(num)
    count = 0
    (1..num).each do |i|
        count += 1 if num % i == 0
    end
    count
end

def matrix_addition(matr1, matr2)
    result_matr = Array.new(matr1.length) { Array.new(matr1[0].length)}

    (0...matr1.length).each do |i|
        (0...matr1[0].length).each do |j|
            result_matr[i][j] = matr1[i][j] + matr2[i][j]
        end
    end

    result_matr
end

def matrix_addition_reloaded(*args)
    return nil if !args.all? {|ele| ele.length == args[0].length} 
    args.inject {|acc,el| matrix_addition(acc,el)}
end
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def mutual_factors(*num)
    results = []
    hash = {}
    hashContains = false
    num.each { |ele| hash[ele] = getDivisors(ele)} 
    hash[num[0]].each do |val|
        hash.each_value do |val2| 
            if val2.include?(val)
                hashContains = true
            else
                hashContains = false
                break
            end
        end
        results << val if hashContains
    end
    results
end

def getDivisors(num)
    results = []
    (1..num).each do |i|
        results << i if num % i == 0
    end
    results
end

def tribonacci_number(num)
    sequence = [1,1,2]
    num.times do
        sequence << sequence[-3] + sequence[-2] + sequence[-1]
    end
    sequence[num-1]
end

def squarocol?(matrix)
    row = false
    column = false
    columns = []

    matrix.each do |arr|
        if arr.all? { |ele| ele == arr[0]} 
            row = true
        end
    end


    (0...matrix.length).each do |i|
        temp = []
        matrix.each do |arr|
            temp << arr[i]
            columns << temp
        end
    end
    columns.each do |arr|
        if arr.all? { |ele| ele == arr[0]} 
            column = true
        end
    end
    return row || column

end

def squaragonal?(matrix)
    d1 = []
    d2 = []
    count = 0
    length = matrix[0].length-1
    d1boo = false
    d2boo = false
    (0...matrix.length).each do |i|
        d1 << matrix[i][i]
    end
    (0...matrix.length).each do |i|
        d2 << matrix[i][length-count]
        count += 1
    end
    d1boo = true if d1.all? { |ele| ele == d1[0]} 
    d2boo = true if d2.all? { |ele| ele == d2[0]}
    d1boo || d2boo
end

def pascals_triangle(num)
    temp = [1]
    results = []
    num.times do 
        results << temp
        temp = pascalHelper(temp) 
    end
    results
end

def pascalHelper(arr) 
    results = []
    arr.each_with_index do |ele, i|
        if i == 0 
            results << 1
        else
            results << ele + arr[i-1]
        end
    end
    results << 1
    results
end


def is_prime?(n)
    return false if n < 2
    (2...n).each do |i|
        return false if n % i == 0
    end  
    true
end


def mersenne_prime(n)
    prime_counter = 2
    temp = 2
    n.times do 
        temp *= 2
        prime_counter = temp - 1
        while !is_prime?(prime_counter)
            temp *= 2
            prime_counter = temp - 1
        end
    end
    prime_counter
end

def str_to_num(str)
    count = 0
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    str.each_char do |char|
        count += alphabet.index(char) + 1
    end
    count
end

def is_triangular?(n)
    (1..n).each do |i|
        return true if (i * (i+1))/2 == n
    end
    false
end

def triangular_word?(str)
    return is_triangular?(str_to_num(str))
end


def consecutive_collapse(arr)
    collapsed = false
    results = arr
    while !collapsed
        collapsed = true
        results = results.select {|ele| !ele.nil?}
        results.each_with_index do |ele, i|
            if i != results.length-1 && !ele.nil?
                if results[i+1] == ele + 1 || results[i+1] == ele - 1
                    results[i], results[i+1] = nil, nil
                    collapsed = false
                    break
                end
            end
        end
    end
    results = results.select {|ele| !ele.nil?}
    results
end


def pretentious_primes(arr, num)
    pretentious = arr
    absolut = -num
    if num > 0
        num.times do 
            pretentious = pretentious.map {|ele| next_prime(ele)}
        end 
    else
        absolut.times do
            pretentious = pretentious.map {|ele| previous_prime(ele)}
        end
    end
    pretentious
end

def next_prime(n)
    prime_counter = n + 1
    while !is_prime?(prime_counter)
        prime_counter += 1
    end
    prime_counter
end

def previous_prime(n)
    return nil if n.nil? || n <= 2
    prime_counter = n - 1
    while !is_prime?(prime_counter)
        prime_counter -= 1
    end
    prime_counter
end

