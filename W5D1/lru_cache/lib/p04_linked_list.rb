require "byebug"
class Node

  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  # def to_s
  #   "#{@key}: #{@val}"
  # end

  def inspect
    "key:#{self.key}, val:#{self.val}, next:#{self.next}, prev:#{self.prev}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    current_node = @head
    while current_node.next != @tail
      current_node = current_node.next
    end
    current_node.next = new_node
    @tail.prev = new_node
    new_node.next = @tail
    new_node.prev = current_node
  end

  def update(key, val)
    current_node = @head
    while current_node != @tail
      if current_node.key == key
        current_node.val = val
        break
      end
      current_node = current_node.next
    end
  end

  def remove(key)
    if self.include?(key)
      current_node = nil
      self.each do |node|
        current_node = node if node.key == key
      end
      previous_node = current_node.prev
      next_node = current_node.next
      previous_node.next = next_node
      next_node.prev = previous_node
    end
  end

  def each
    current_node = @head.next
    while current_node.next != @tail && current_node != @tail
      yield current_node
      current_node = current_node.next
    end
    yield current_node
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
