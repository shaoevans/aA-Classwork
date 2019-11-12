require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_node!(@map.get(key)) #node
    else
      node = calc!(key)
      @map.set(key, node)
      update_node!(node)
    end
    if @max == count    
      @map.delete(eject!)
    end
    @map.get(key).val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    node = Node.new(key, @prc.call(key))
    node
  end

  def update_node!(node)
    unless node.next.nil?
      next_node = node.next 
      prev_node = node.prev
      next_node.prev = prev_node
      prev_node.next = next_node
    end
    tail = @store.last.next #insertion into back of linkedlist
    prev = @store.last
    prev.next = node
    node.prev = prev
    tail.prev = node
    node.next = tail
    node.val
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    head = @store.first.prev #head
    node = @store.first.next #node after first
    head.next = node
    node.prev = head
    node.key
  end
end
