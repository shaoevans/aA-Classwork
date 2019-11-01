# accepts a number as input

def is_prime?(n)
    return false if n < 2

    (2...n).each do |i|
        return false if n % i == 0
    end
    
    true
end

def nth_prime(n)
    prime_counter = 1
    n.times do 
        prime_counter += 1
        while !is_prime?(prime_counter)
            prime_counter += 1
        end
    end
    prime_counter
end

# accepts two numbers, min and max as inputs
# returns an array of all primes between min and max

def prime_range(min, max)
    primes = []
    (min..max).each {|i| primes << i if is_prime?(i)}
    primes
end