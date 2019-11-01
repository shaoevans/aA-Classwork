require "byebug"

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        results = []
        i = 0
        while i < self.length
            results << self[i] if prc.call(self[i])
            i += 1
        end
        results
    end

    def my_reject(&prc)
        results = []
        i = 0
        while i < self.length
            results << self[i] if !prc.call(self[i])
            i += 1
        end
        results
    end

    def my_any?(&prc)
        result = false
        i = 0
        while i < self.length
            result = true if prc.call(self[i])
            i += 1
        end
        result
    end

    def my_all?(&prc)
        result = true
        i = 0
        while i < self.length
            result = false if !prc.call(self[i])
            i += 1
        end
        result
    end

    def my_flatten
        flattened = []
        i = 0
        while i < self.length
            if self[i].is_a?(Array)
                flattened += self[i].my_flatten 
            else
                flattened += [self[i]]
            end
            i += 1
        end
        flattened
    end
    
    def my_zip(*arrs)
        results = []
        l = self.length
        (0...l).each do |i|
            results << [self[i]] + arrs.map { |arr| arr[i] }
        end
        results
    end

    def my_rotate(num=1)
        results = self.dup
        if num > 0
            num.times {results << results.shift}
        else
            -num.times {results.unshift(results.pop)}
        end
        results
    end

    def my_join(char="")
        result = ""
        i = 0
        while i < self.length-1
            result += self[i].to_s
            result += char
            i += 1
        end
        result += self[-1]
        result
    end

    def my_reverse
        results = []
        i = self.length-1
        while i >= 0
            results << self[i]
            i -= 1
        end
        results
    end

    def bubble_sort!(&prc)
        unsorted = true
        while unsorted
            unsorted = false
            (0...self.length-1).each do |i|
                if prc.call(self[i],self[i+1])
                    unsorted = true
                    self[i], self[i+1] = self[i+1], self[i]
                end
            end
        end
        self
    end

    def bubble_sort(&prc)
        duplicate = self.dup
        unsorted = true
        while unsorted
            unsorted = false
            (0...duplicate.length-1).each do |i|
                if prc.call(duplicate[i],duplicate[i+1])
                    unsorted = true
                    duplicate[i], duplicate[i+1] = duplicate[i+1], duplicate[i]
                end
            end
        end
        duplicate
    end
end

def factors(num)
    results = []
    max_divisor = Math.sqrt(num).floor
    (1..max_divisor).each do |i|
        if num % i == 0
            results << i
            results << num/i 
        end
    end
    results
end

def substrings(str)
    results = []
    (0...str.length).each do |length|
        str.each_char.with_index do |char, i|
            if i + length < str.length
                results << str[i..i+length] 
            else
                break
            end
        end
    end
    
    results
end

def subwords(word, dictionary)
    dictionary.select {|str| word.include?(str)}
end

