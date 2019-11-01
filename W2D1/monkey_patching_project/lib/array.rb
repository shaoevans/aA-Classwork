# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / self.length.to_f
    end
    
    def median
        sorted = self.sort
        if sorted.length.odd?
            sorted[(sorted.length - 1) / 2]
        elsif sorted.length == 0
            nil
        else
            (sorted[sorted.length/2] + sorted[(sorted.length/2)-1])/2.0
        end
    end

    def counts
        counter = Hash.new(0)
        self.each { |el| counter[el] += 1 }
        return counter
    end

    def my_count(value)
        counter = 0 
        self.each {|el| counter += 1 if el == value}
        counter
    end

    def my_index(val)
        self.each.with_index { |el, i| return i if el == val }
        nil
    end

    def my_uniq
        results = []
        self.each {|el| results << el if !results.include?(el)}
        results
    end

    def my_transpose
        length = self.length
        results = Array.new(length) { Array.new(length) }
        length.times do |i|
            length.times do |j|
                results[i][j] = self[j][i]
            end
        end
        results
    end
                

end
