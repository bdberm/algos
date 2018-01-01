#Design and algorithm to find the first common ancestor of two nodes
#in a binary tree. Avoid storing additional nodes in a data structure.

require_relative "./binary_node"

def first_common_ancestor(root, nodeA, nodeB)
  first_descendant = nil

  if root.left
    left_descendant = find_descendant(root.left, nodeA, nodeB)
    first_descendant = left_descendant if left_descendant
  end

  if !first_descendant
    right_descendant = find_descendant(root.right, nodeA, nodeB)
    first_descendant = right_descendant if right_descendant
  end

  return nil unless first_descendant

  other_descendant = (first_descendant == nodeA) ? nodeB : nodeA

  current = first_descendant

  until !current
    found_other = find_descendant(current, other_descendant)
    return current if found_other
    current = current.parent
  end

  return nil

end

def find_descendant(parent, descendantA, descendantB=nil)
  return parent if parent == descendantA || parent == descendantB

  if parent.left
    leftCheck = find_descendant(parent.left, descendantA, descendantB)
    return leftCheck if leftCheck
  end

  if parent.right
    rightCheck = find_descendant(parent.right, descendantA, descendantB)
    return rightCheck if rightCheck
  end

  nil
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
puts(first_common_ancestor(root, root.left.right.left, root.right.left.left).val === "A")
puts(first_common_ancestor(root, root.left.right.left, root.left.left.left).val === "B")
