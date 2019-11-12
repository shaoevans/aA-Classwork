require_relative 'p04_linked_list'
require "byebug"
class HashMap
  include Enumerable
  attr_accessor :count
  attr_reader :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    linked_list = bucket(key)
    linked_list.include?(key)
  end

  def set(key, val)
    if @count == @store.length
      resize!
    end
    linked_list = bucket(key)
    if linked_list.include?(key)
      linked_list.update(key, val)
    else
      linked_list.append(key, val)
      @count += 1
    end
  end

  def get(key)
    linked_list = bucket(key)
    linked_list.get(key)
  end

  def delete(key)
    linked_list = bucket(key)
    if linked_list.include?(key)
      @count -= 1
      linked_list.remove(key)
    end
  end

  def each

    @store.each do |linked_list|
      next if linked_list.empty?
      linked_list.each do |node|
        yield [node.key, node.val]
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_hashmap = HashMap.new(num_buckets * 2)
    @store.each do |linked_list|
      linked_list.each do |node|
        new_hashmap.set(node.key, node.val)
      end
    end
    @store = new_hashmap.store
  end

  def bucket(key)
    @store[key.hash % @store.length]
    # optional but useful; return the bucket corresponding to `key`
  end
end
