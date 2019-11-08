class Disk
  attr_reader :val
  def initialize(val=nil)
    @val = val
  end

  def to_s
    str = ""
    base = "▀▀▀▀"
    @val.times {str += base}
    # str.center(32).colorize(COLORS[self.val])
    str
  end
end