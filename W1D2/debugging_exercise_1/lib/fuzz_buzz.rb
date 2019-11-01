# Debug this code to pass rspec! There is 1 mistake to fix.

# Write a method, fuzz_buzz, that accepts a number as an arg. 
# The method should return an array of numbers from one to the given number that are not divisible by 3 or 5.


def fuzz_buzz(num)
    numbers = []
    results = []


    (1..num).each do |i|
        if i % 3 != 0 
            numbers << i
        end
    end
    numbers.each do |i|
        if i % 5 != 0
            results << i
        end
    end

    results
end

p fuzz_buzz(5) # => 1,2,4