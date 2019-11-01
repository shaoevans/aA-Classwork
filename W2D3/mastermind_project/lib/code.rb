require "byebug"
class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.map {|char| char.upcase}
       .all? {|char| POSSIBLE_PEGS.keys.include?(char)}
  end

  def initialize(arr)
    if !Code.valid_pegs?(arr)
      raise StandardError.new
    else
      @pegs = arr.map {|char| char.upcase}
    end
  end

  def self.random(num)
    random = []
    num.times {random << POSSIBLE_PEGS.keys[rand(0..3)]}
    return Code.new(random)
  end

  def self.from_string(str)
    return Code.new(str.split(""))
  end

  def [](num)
    @pegs[num]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    counter = 0
    code.length.times {|i| counter += 1 if code.pegs[i] == self.pegs[i]}
    counter
  end

  def num_near_matches(code)
    counter = Hash.new(0)
    result = 0
    @pegs.each {|ele| counter[ele] += 1}
    code.pegs.each_with_index do |ele, i|
      if ele == @pegs[i]
        counter[ele] -= 1
      elsif counter.has_key?(ele)
        result += 1
      end
    end
    result
  end

  def ==(code)
    self.pegs == code.pegs
  end


end