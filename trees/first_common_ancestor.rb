#Design and algorithm to find the first common ancestor of two nodes
#in a binary tree. Avoid storing additional nodes in a data structure.

#Approcah: Find First Node
#Check if first node's descndants include second node. If so, return
#first node's parent.
#If second node not found, go to parent and check other branch. Continue
#until you find a node who's descendants include other node.

require_relative "./binary_node"

def first_common_ancestor(root, nodeA, nodeB, found={firstFound: false})

  found[:firstFound] = true if !found[:firstFound] && (root == nodeA || root == nodeB)




end

def is_descendant(parent, descendant)
  return true if parent == descendant

  if parent.left
    leftCheck = is_descendant(parent.left, descendant)
    return leftCheck if leftCheck
  end

  if parent.right
    rightCheck = is_descendant(parent.right, descendant)
    return rightCheck if rightCheck
  end

  false
end

root = BinaryNode.new("A")
root.left = BinaryNode.new("B")
root.left.parent = root
root.right = BinaryNode.new("C")
root.right.parent = root
root.left.left = BinaryNode.new("D")
root.left.left.parent = root.left
root.left.right = BinaryNode.new("E")
root.left.right.parent = root.left
root.right.left = BinaryNode.new("F")
root.right.left.parent = root.right
root.right.right = BinaryNode.new("G")
root.right.right.parent = root.right
root.left.left.left = BinaryNode.new("H")
root.left.left.left.parent = root.left.left
root.left.left.right = BinaryNode.new("I")
root.left.left.right.parent = root.left.left
root.left.right.left = BinaryNode.new("J")
root.left.right.left.parent = root.left.right
root.left.right.right = BinaryNode.new("K")
root.left.right.right.parent = root.left.right
root.right.left.left = BinaryNode.new("L")
root.right.left.left.parent = root.right.left
root.right.left.right = BinaryNode.new("M")
root.right.left.right.parent = root.right.left
root.right.right.left = BinaryNode.new("N")
root.right.right.left.parent = root.right.right
root.right.right.right = BinaryNode.new("O")
root.right.right.left.parent = root.right.right

puts(first_common_ancestor(root, root.left.right.left, root.left.right.right).val === "E")
puts(first_common_ancestor(root, root.left.right.left, root.left.left).val === "B")
puts(first_common_ancestor(root, root.left.right.left, root.right.left.left) === "A")
