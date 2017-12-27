#Implement a function to check if a binary tree is a binary search
#tree. A binary search tree is one such that for any node, all
#left descendants <= node < all rihgt descendants

require_relative "./binary_node"

def check_bst?(node, min=nil, max=nil)
  return false if min && node.val <= min
  return false if max && node.val > max

  if node.left && node.right
    return check_bst?(node.left, min, node.val) && check_bst?(node.right, node.val, max)
  elsif node.left
    return check_bst?(node.left, min, node.val)
  elsif node.right
    return check_bst?(node.right, node.val, max)
  else
    return true
  end

end

#TEST

# root = BinaryNode.new(50)
# root.left = BinaryNode.new(30)
# root.right = BinaryNode.new(80)
# root.left.left = BinaryNode.new(15)
# root.left.right = BinaryNode.new(40)
# root.right.left = BinaryNode.new(65)
# root.right.right = BinaryNode.new(110)
# root.left.left.left = BinaryNode.new(8)
# root.left.left.right = BinaryNode.new(20)
# root.right.right.left = BinaryNode.new(95)
# root.right.right.right = BinaryNode.new(120)
#
# puts(check_bst?(root) == true)
#
# root = BinaryNode.new(50)
# root.left = BinaryNode.new(30)
# root.right = BinaryNode.new(80)
# root.left.left = BinaryNode.new(15)
# root.left.right = BinaryNode.new(40)
# root.right.left = BinaryNode.new(65)
# root.right.right = BinaryNode.new(110)
# root.left.left.left = BinaryNode.new(8)
# root.left.left.right = BinaryNode.new(20)
# root.right.right.left = BinaryNode.new(75)
# root.right.right.right = BinaryNode.new(120)
#
# puts(check_bst?(root) == false )
