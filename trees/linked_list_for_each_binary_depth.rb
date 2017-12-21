#An algorithm that, given the root of a binary tree, creates a linked
#list of all the nodes at each depth

require_relative "./binary_node"
require_relative "../linked_lists/linked_list_node"

def lists_from_trees(node, level=0, lists={})
  list_node = DoubleNode.new(node.val)

  if lists[level]
    list_node.prev_node = lists[level]
    lists[level].next_node = list_node
  end

  lists[level] = list_node

  lists_from_trees(node.left, level + 1, lists) if node.left
  lists_from_trees(node.right, level + 1, lists) if node.right

  lists
end

#TEST

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

# lists = lists_from_trees(root)
# puts(lists[0].val === 1)
# puts(lists[0].prev_node.nil?)
# puts(lists[0].next_node.nil?)
# puts(lists[1].val === 3)
# puts(lists[1].prev_node.val === 2)
# puts(lists[1].prev_node.prev_node.nil?)
# puts(lists[2].val === 7)
# puts(lists[2].prev_node.val === 6)
# puts(lists[2].prev_node.prev_node.val === 5)
# puts(lists[2].prev_node.prev_node.prev_node.val === 4)
# puts(lists[2].prev_node.prev_node.prev_node.prev_node.nil?)
# puts(lists[3].val === 15)
# puts(lists[3].prev_node.val === 14)
# puts(lists[3].prev_node.prev_node.val === 13)
# puts(lists[3].prev_node.prev_node.prev_node.val === 12)
# puts(lists[3].prev_node.prev_node.prev_node.prev_node.val === 11)
# puts(lists[3].prev_node.prev_node.prev_node.prev_node.prev_node.val === 10)
# puts(lists[3].prev_node.prev_node.prev_node.prev_node.prev_node.prev_node.val === 9)
# puts(lists[3].prev_node.prev_node.prev_node.prev_node.prev_node.prev_node.prev_node.val === 8)
# puts(lists[3].prev_node.prev_node.prev_node.prev_node.prev_node.prev_node.prev_node.prev_node.nil?)
