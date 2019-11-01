require_relative "polytree"
require "byebug"

class KnightPathFinder
    attr_reader :root_node
    def initialize(pos)
        @position = pos
        @root_node = PolyTreeNode.new(pos)
        @consider_positions = [pos]
        self.build_move_tree
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            current_node = queue.shift
            self.new_move_positions(current_node.value).each {|sub| current_node.add_child(sub)}
            queue += current_node.children
        end
    end

    def self.valid_moves(pos)
        x, y = pos
        posible_pos = [
            [x+2,y+1],
            [x+2,y-1],
            [x-2,y+1],
            [x-2,y-1],
            [x+1,y+2],
            [x+1,y-2],
            [x-1,y+2],
            [x-1,y-2]
        ]

        posible_pos.select {|sub| (0..7).to_a.include?(sub[0]) && (0..7).to_a.include?(sub[1]) }
    end

    def new_move_positions(pos)
        filtered_pos = KnightPathFinder.valid_moves(pos).select {|sub|!@consider_positions.include?(sub)} 
        @consider_positions += filtered_pos
        filtered_pos
    end

    def find_path(end_pos)
        path = trace_back_path(root_node.dfs(end_pos)).reverse
    end

    def trace_back_path(node)
        return [node.value] if node.parent.nil?
        return [node.value] + trace_back_path(node.parent)
    end
end
