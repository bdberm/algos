

class Node 
  attr_accessor :next_node, :val
  
  def initialize(val, next_node = nil)
    @next_node = next_node
    @val = val
  end
  
end

class DoubleNode << Node
  attr_accessor :prev_node
  
  def initialize(val, next_node = nil, prev_node = nil)
    super(val, next_node)
    @prev_node = prev_node
  end  
  
end