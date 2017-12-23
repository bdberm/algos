#Implement a function to check if a binary tree is balanced. For the
#purposes of this question, a blanaced tree is defined to be a tree
#such that the heights of the two subtrees of any node never differ by
#more than one.


require_relative "./binary_node"

def is_balanced_tree?(node, level=0, depths={max_depth: nil, min_depth: nil})
  if (!node.left && !node.right)
    depths[:max_depth] = level if !depths[:max_depth] || level > depths[:max_depth]
    depths[:min_depth] = level if !depths[:min_depth] || level < depths[:min_depth]
    balance = (depths[:max_depth] - depths[:min_depth] > 1) ? false : true
    return balance
  elsif (node.left && node.right)
    left_balance = is_balanced_tree?(node.left, level+1, depths)
    right_balance = is_balanced_tree?(node.right, level+1, depths)
    return left_balance && right_balance
  elsif (node.left)
    return is_balanced_tree?(node.left, level+1, depths)
  else
    return is_balanced_tree?(node.right, level+1, depths)
  end

end

#TEST
#
# root = BinaryNode.new(1)
# root.left = BinaryNode.new(2)
# root.right = BinaryNode.new(3)
# root.left.left = BinaryNode.new(4)
# root.left.right = BinaryNode.new(5)
# root.right.left = BinaryNode.new(6)
# root.right.right = BinaryNode.new(7)
# root.left.left.left = BinaryNode.new(8)
# root.left.left.right = BinaryNode.new(9)
# root.left.right.left = BinaryNode.new(10)
# root.left.right.right = BinaryNode.new(11)
# root.right.left.left = BinaryNode.new(12)
# root.right.left.right = BinaryNode.new(13)
# root.right.right.left = BinaryNode.new(14)
# root.right.right.right = BinaryNode.new(15)
#
# puts(is_balanced_tree?(root))
