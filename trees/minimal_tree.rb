#Given a sorted (increasing order) array with unique integer
#elements, write an algorithm to create a binary search
#tree with minimal height

require_relative './binary_node'

def minimal_tree(arr)
  return nil if arr.empty?

  mid = arr.length / 2
  node = BinaryNode.new(arr[mid])

  node.left = minimal_tree(arr.take(mid))
  node.right = minimal_tree(arr.drop(mid + 1))

  node
end

# node = minimal_tree([1,2,3,4,5,6,7])
# puts(node.val == 4)
# puts(node.left.val == 2)
# puts(node.left.left.val == 1)
# puts(node.left.left.left.nil?)
# puts(node.left.left.right.nil?)
# puts(node.left.right.val == 3)
# puts(node.left.right.left.nil?)
# puts(node.left.right.right.nil?)
# puts(node.right.val == 6)
# puts(node.right.left.val == 5)
# puts(node.right.left.left.nil?)
# puts(node.right.left.right.nil?)
# puts(node.right.right.val == 7)
# puts(node.right.right.left.nil?)
# puts(node.right.right.right.nil?)
#
# node = minimal_tree([1,2])
# puts(node.val == 2)
# puts(node.left.val == 1)
# puts(node.right.nil?)
