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

node = minimal_tree([1,2,3,4,5,6,7])
puts(node.val)
puts(node.right.left.val)
