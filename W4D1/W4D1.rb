require 'set'

class GraphNode
  attr_reader :val, :neighbors
  attr_writer :val, :neighbors

  def initialize(val)
    self.val = val
    self.neighbors = []
  end

  def add_neighbor(node)
    self.neighbors << node
  end
end

def bfs(starting_node, target_value)
  start = [starting_node]
  checked = Set.new()

  until start.empty?
    node = start.shift
    unless checked.include?(node)
      return node.val if node.val == target_value
      checked.add(node)
      start += node.neighbors
    end
  end
  
  return nil
end

# a = GraphNode.new('a')
# b = GraphNode.new('b')
# c = GraphNode.new('c')
# d = GraphNode.new('d')
# e = GraphNode.new('e')
# f = GraphNode.new('f')
# a.neighbors = [b, c, e]
# c.neighbors = [b, d]
# e.neighbors = [a]
# f.neighbors = [e]