class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent)
        @parent.children.delete(self) if @parent
        @parent = parent
        @parent.children << self if (!@parent.nil? && !@parent.children.include?(self))
    end

    def add_child(child)
        new_child = PolyTreeNode.new(child)
        new_child.parent = self
    end

    def remove_child(child)
        if @children.include?(child)
            @children.delete(child)
            child.parent = nil
        else
            raise "Error"
        end
    end

    def dfs(value)
        return self if @value == value
        @children.each do |child|
            search_result = child.dfs(value)
            return search_result if !search_result.nil?
        end 
        nil
    end

    def bfs(value)
        queue = [self]
        until queue.empty?
            node = queue.shift
            return node if node.value == value
            queue += node.children
        end
        nil
    end

    def inspect
        "children: #{@children}; parent: #{@parent}; value: #{@value}"
    end
end





    #     a
    #    / \
    #   b   c

    #   b.parent = a
    #   a.children [] => [b]
    #   c.parent = a
    #   a.children [b] => [b,c]
    #   b.parent = a
    #   a.children [b,c] => [b,c]