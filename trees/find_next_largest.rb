#Find the "next" node (i.e. next largest) of a given node
#in a binary search tree

require_relative "./binary_node"

def find_next_highest(node)
  if node.right
    return leftmost_node(node.right)
  else
    return find_first_parent_left(node)
  end
end

def leftmost_node(node)
  leftmost = node

  until !leftmost.left
    leftmost = node.left
  end

  leftmost
end

def find_first_parent_left(node)
  temp_node = node

  until temp_node.parent.nil?
    return temp_node.parent  if temp_node.parent.left === temp_node
    temp_node = temp_node.parent
  end
  nil
end

#TEST
# 
# root = BinaryNode.new(50)
# root.left = BinaryNode.new(30)
# root.left.parent = root
# root.right = BinaryNode.new(80)
# root.right.parent = root
# root.left.left = BinaryNode.new(15)
# root.left.left.parent = root.left
# root.left.right = BinaryNode.new(40)
# root.left.right.parent = root.left
# root.right.left = BinaryNode.new(65)
# root.right.left.parent = root.right
# root.right.right = BinaryNode.new(110)
# root.right.right.parent = root.right
# root.left.left.left = BinaryNode.new(8)
# root.left.left.left.parent = root.left.left
# root.left.left.right = BinaryNode.new(20)
# root.left.left.right.parent = root.left.left
# root.right.right.left = BinaryNode.new(95)
# root.right.right.left.parent = root.right.right
# root.right.right.right = BinaryNode.new(120)
# root.right.right.right.parent = root.right.right
#
# puts(find_next_highest(root).val === 65)
# puts(find_next_highest(root.right.right.right).nil?)
# puts(find_next_highest(root.right.left).val === 80)
# puts(find_next_highest(root.left.left.right).val === 30)
