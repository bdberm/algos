

class Node
  attr_accessor :next_node, :val

  def initialize(val, next_node = nil)
    @next_node = next_node
    @val = val
  end

end

class DoubleNode < Node
  attr_accessor :prev_node

  def initialize(val, next_node = nil, prev_node = nil)
    super(val, next_node)
    @prev_node = prev_node
  end

  def inspect
    next_val = self.next_node ? self.next_node.val : nil
    prev_val = self.prev_node ? self.prev_node.val : nil
    "Value: #{self.val}, Next: #{next_val}, Prev: #{prev_val}"
  end

end
